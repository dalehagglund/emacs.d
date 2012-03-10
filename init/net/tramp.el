;;
;; tramp -- access files local to other machines
;;

(when (< emacs-major-version 23)
  (add-to-path 'load-path (concat lisp-home "emacs22/tramp-2.1.3")))
(require 'tramp)

(setq tramp-default-method "ssh"
      tramp-persistency-file-name (concat emacs-state-dir "tramp-conn-history"))

