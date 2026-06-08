; extends
; Custom highlights for git commit editor to work with markdown like syntax

(title) @function

(branch) @string

(change) @keyword

(filepath) @string

(arrow) @punctuation.delimiter

(subject
  (subject_prefix) @function @nospell)

(prefix
  (type) @keyword @nospell)

(prefix
  (scope) @variable.parameter @nospell)

(prefix
  [
   "("
   ")"
   ":"
   ] @punctuation.delimiter)

(prefix
  "!" @punctuation.special)

(message) @spell

(trailer
  (token) @label)

; (trailer (value) @none)
(breaking_change
  (token) @comment.error)

(breaking_change
  (value) @none @spell)

(scissor) @comment

((message_line) @comment
 (#lua-match? @comment "^;"))

((message_line) @comment @nospell
 (#lua-match? @comment "^#"))
