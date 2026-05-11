# Zed-Kulala

A port of [kulala.nvim](https://github.com/mistweaverco/kulala.nvim) for [Zed](https://zed.dev).

## Features
- Edit and execute HTTP requests
- Get Kulala HTTP–specific syntax highlighting, structural selections, and text objects
- Convert HTTP request into a shareable `curl` command
- Rely on Kulala language server [kulala-ls](https://github.com/mistweaverco/kulala-ls) for completion, validation, and diagnostics
- Preview responses with Content-Type aware formatting for JSON, XML, HTML

## Quickstart

### Requirements
- [Neovim](https://neovim.io) 0.12.0 or later
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [Kulala.nvim](https://neovim.getkulala.net)

### Installation
1. Install nvim-treesitter and kulala.nvim with Neovim's built-in package manager vim.pack

```lua
vim.api.nvim_create_autocmd('PackChanged', { callback = function(ev)
  local name, kind = ev.data.spec.name, ev.data.kind
  if name == 'nvim-treesitter' and (kind == 'install' or kind == 'update') then
    if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
    vim.cmd('TSUpdate')
  end
end })

vim.pack.add({
  'https://github.com/mistweaverco/kulala.nvim',
  'https://github.com/nvim-treesitter/nvim-treesitter',
})
```

2. Clone the repository, and then install this extension via "Install Dev Extension" in Zed

```sh
git clone https://github.com/A-23187/zed-kulala.git
```

3. Install the [zed_kulala](./zed_kulala) script to your PATH

```sh
# for example, copy to ~/.local/bin/zed_kulala, and make it executable
# make sure ~/.local/bin is in your PATH
cp zed_kulala ~/.local/bin/zed_kulala
chmod +x ~/.local/bin/zed_kulala
```

## License
Apache 2.0
