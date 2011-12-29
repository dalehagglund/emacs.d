;;
;; nxml mode
;;

(add-to-list 'auto-mode-alist
	     '("\\.\\(xml\\|xsl\\|rng\\|xhtml\\)$" . nxml-mode))
(setq nxml-slash-auto-complete-flag t
     nxml-sexp-element-flag t
     nxml-bind-meta-tab-to-complete-flag t
     nxml-auto-insert-xml-declaration-flag t)

