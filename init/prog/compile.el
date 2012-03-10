;;;
;;; compile
;;;

(require 'compile)
;; What language is this for?
(add-to-list 
 'compilation-error-regexp-alist
 '("^File \\(.*\\), Line \\([0-9]+\\)$" 1 2)
 'append)

