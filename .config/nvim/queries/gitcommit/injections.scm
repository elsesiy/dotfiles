; extends
; Inject text language for word-level Git keyword highlighting
; Text parser should tokenize individual words
((message) @injection.content
 (#set! injection.language "markdown")
 (#set! injection.include-children))
