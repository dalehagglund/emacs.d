;;
;; org and remember setup 
;;

(when (< emacs-major-version 23)
  (add-to-list 'load-path (concat lisp-home "emacs22/org-6.13a"))
  (add-to-list 'load-path (concat lisp-home "emacs22/remember-2.0")))

(require 'org)
;;(require 'org-export-latex)

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl"    'org-store-link)
(define-key global-map "\C-ca"	  'org-agenda)

(setq org-hide-leading-stars t
      org-log-done t
      org-directory "~/Dropbox/org/"
      org-default-notes-file (concat org-directory "notes.org")
      org-agenda-files (list org-directory))

(require 'remember)
(org-remember-insinuate)
(define-key global-map "\C-cr"	  'org-remember)
(setq org-remember-templates
      (list
       '("todo" ?t "** TODO %?\n   %i\n   %a\n" nil "Unsorted Tasks")
       '("idea" ?i "* %t: %?\n  %i\n  %a\n" "ideas.org" top)))

