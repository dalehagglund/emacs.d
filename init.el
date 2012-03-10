(require 'cl)
(setenv "INFOPATH" nil)			; remove any INFOPATH variable

(setq home		(expand-file-name "~/")
      init-dir		user-emacs-directory
      emacs-state-dir   (concat init-dir "state/")
      lisp-home		(concat home "emacs/lisp/")
      info-home		(concat home "emacs/info/")
      exec-directory	(concat home "emacs/exec-directory/")
      custom-file	(concat init-dir "custom.el"))

(defun load-init-file (file)
  (load (concat init-dir file)))

(push info-home				Info-default-directory-list)

(add-to-list 'load-path lisp-home)
(add-to-list 'load-path (concat init-dir "lisp/"))
(when (< emacs-major-version 23)
  (add-to-list 'load-path (concat lisp-home "emacs22")))

;;
;; There's some sort of order-dependency below that needs my local
;; version of gnus added to the load-path before any of the other init
;; code runs.  Not sure what the problem is, but you end up with mixed
;; versions of .elc files if load-path isn't modified early enough.
;;
(load-init-file "mail/gnus-paths.el")

(setq printer-name	"2-kitchen"
      ps-printer-name	printer-name

      diff-switches	"-u"

      backup-by-copying-when-linked t	; make hard links work better
      comint-buffer-maximum-size 1000000 ; 1 MB, more or less

      auto-save-list-file-prefix (concat emacs-state-dir "auto-save-list/")
)

(add-hook 'comint-output-filter-functions 'comint-truncate-buffer)
(add-to-list 'auto-mode-alist '("\\.tgz$" . tar-mode))

(require 'epa-file)
(epa-file-enable)
(setq epa-file-cache-passphrase-for-symmetric-encryption t)

(load-init-file "ui/misc.el")
(load-init-file "ui/gosling.el")
(load-init-file "ui/clipboard.el")
(load-init-file "ui/ido.el")
(load-init-file "ui/uniquify.el")
(load-init-file "ui/ibuffer.el")

(server-start)
(auto-compression-mode t)

(load-init-file "net/w3m.el")		; web browsing
(load-init-file "net/tramp.el")		; remote file access
(load-init-file "net/erc.el")		; irc
(load-init-file "net/ssh.el")
(load-init-file "net/url.el")

(load-init-file "text/wikipedia-mode.el")
(load-init-file "text/org.el")
(load-init-file "text/filladapt.el")
(load-init-file "text/text.el")
(load-init-file "text/table.el")

(load-init-file "prog/gdb.el")
(load-init-file "prog/git.el")
(load-init-file "prog/compile.el")
(load-init-file "prog/misc.el")
(load-init-file "prog/python.el")
(load-init-file "prog/c.el")
(load-init-file "prog/fontlock.el")
(load-init-file "prog/promela.el")
(load-init-file "prog/alloy.el")
(load-init-file "prog/lua.el")

(load-init-file "mail/core.el")
(load-init-file "mail/message.el")
(load-init-file "mail/gnus.el")
(load-init-file "mail/bbdb.el")
(load-init-file "mail/smtp.el")

(put 'scroll-left 'disabled nil)
(put 'eval-expression 'disabled nil)
(put 'narrow-to-region 'disabled nil)

;;; load external customizations

(load custom-file t)
