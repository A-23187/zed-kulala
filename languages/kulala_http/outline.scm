(comment) @annotation

; Section
; @name come from the value in request_separator
(section (request_separator value: (_) @name)) @item
; @name come from the value of @name metadata
(section
  (request_separator !value)
  ((metadata name: (_) @_name value: (_) @name) (#eq? @_name "name"))
) @item
; @name come from the method and url of the request
(section
  (request_separator !value)
  request: (request method: (_) @name url: (_) @name)
) @item

; Variable Declaration
(section (variable_declaration "@" @context name: (_) @name) @item)

; Metadata
(section
  (request_separator !value)
  (
    (metadata "@" @context name: (_) @_name @name) (#not-eq? @_name "name")
  ) @item
)
(section
  (request_separator value: (_))
  ((metadata "@" @context name: (_) @name) (#not-eq? @name "name")) @item
)
(section
  (request_separator value: (_))
  (
    (metadata "@" @context name: (_) @_name @name value: (_) @name)
    (#eq? @_name "name")
  ) @item
)
