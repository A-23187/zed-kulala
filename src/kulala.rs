use std::env;
use zed_extension_api::{self as zed};

const PACKAGE_NAME: &'static str = "@mistweaverco/kulala-ls";
const SERVER_PATH: &'static str = "node_modules/@mistweaverco/kulala-ls/cli.cjs";

struct KulalaExtension;

impl KulalaExtension {}

impl zed::Extension for KulalaExtension {
    fn new() -> Self {
        Self {}
    }
    fn language_server_command(
        &mut self,
        language_server_id: &zed::LanguageServerId,
        _worktree: &zed::Worktree,
    ) -> zed::Result<zed::Command> {
        let check_for_update = true;
        let latest_version = match zed::npm_package_installed_version(PACKAGE_NAME)? {
            Some(installed_version) => {
                if check_for_update {
                    zed::set_language_server_installation_status(
                        language_server_id,
                        &zed::LanguageServerInstallationStatus::CheckingForUpdate,
                    );
                    let latest_version = zed::npm_package_latest_version(PACKAGE_NAME)?;
                    if installed_version != latest_version {
                        Some(latest_version)
                    } else {
                        None
                    }
                } else {
                    None
                }
            }
            None => Some(zed::npm_package_latest_version(PACKAGE_NAME)?),
        };
        latest_version.map_or(Ok(()), |latest_version| {
            zed::set_language_server_installation_status(
                language_server_id,
                &zed::LanguageServerInstallationStatus::Downloading,
            );
            zed::npm_install_package(PACKAGE_NAME, &latest_version)
        })?;
        Ok(zed::Command {
            command: zed::node_binary_path()?,
            args: vec![
                env::current_dir()
                    .map_err(|e| e.to_string())?
                    .join(SERVER_PATH)
                    .to_str()
                    .ok_or("path contains non utf-8 characters")?
                    .to_string(),
                "--stdio".to_string(),
            ],
            env: Default::default(),
        })
    }
}

zed::register_extension!(KulalaExtension);
