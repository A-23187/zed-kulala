;Request
(request_separator
  value: (_) @label)

; Methods
(method) @keyword

; Headers
(header
  name: (_) @constant)

(header
  value: (_) @string)

; Variables
(identifier) @variable (#set! priority 110)

(variable_declaration
  "@" @punctuation.special)

(variable_declaration
  (value) @string)

(variable_declaration_inline
  "@" @punctuation.special)

(variable_declaration_inline
  (value) @string)

; Commands
(command
  name: (_) @function.call
  value: (_) @variable.parameter)

; Operators
(metadata
  "=" @operator)

(variable_declaration
  "=" @operator)

(variable_declaration_inline
  "=" @operator)

(operator) @operator

; keywords
(metadata
  "@" @punctuation.special
   name: (_) @keyword)

(metadata
  "@" @punctuation.special
  name: (_) @keyword
  value: (_) @constant)

; Literals
(query_param
  value: (_) @string)

(form_param
  name: (_) @variable)

(form_param
  name: (_) @variable
  value: (_) @string)

(request
  url: (_) @link_uri)

(http_version) @string.special

; Response
(status_code) @number

(status_text) @string

; Punctuation
[
  "{{"
  "}}"
  "{%"
  "%}"
] @punctuation.bracket

(pre_request_script
  "<" @punctuation.special)

(res_handler_script
  ">" @punctuation.special)

(header
  ":" @punctuation.delimiter)

(external_body
  path: (_) @string.special.path)

; Multipart form data
(multipart_boundary_first) @keyword
(multipart_boundary) @keyword
(multipart_boundary_last) @keyword

; redirect
(res_redirect
  path: (_) @string.special.path)

; Comments
[
  (comment)
  (request_separator)
] @comment

; Scripts
(pre_request_script
  (path) @string.special.path)

(res_handler_script
  (path) @string.special.path)

(
  (metadata
    "@" @punctuation.special
    name: (_) @_name @keyword
    value: (_) @label)
  (#eq? @_name "name")
)
