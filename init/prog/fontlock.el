(mapcar (function (lambda (hook) (add-hook hook 'turn-on-font-lock)))
	'(c-mode-common-hook
	  diff-mode-hook
	  lisp-mode-hook
	  emacs-lisp-mode-hook
	  python-mode-hook
	  perl-mode-hook
	  makefile-mode-hook))

(setq font-lock-maximum-decoration
      '((c-mode . 2)
	(c++-mode . 2)
	(makefile-mode . 3)
	(t . 1)))
