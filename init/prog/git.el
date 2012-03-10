;;;
;;; git
;;;

(add-to-list 'load-path (concat lisp-home "magit/"))
(require 'magit)

(setq magit-commit-all-when-nothing-staged nil
      magit-log-edit-confirm-cancellation t
      magit-remote-ref-format 'remote-slash-branch
      magit-completing-read-function #'magit-ido-completing-read
      magit-create-branch-behaviour 'at-point
      magit-diff-refine-hunk t

      magit-diff-hunk-format-options
      '("--patience")

      magit-diff-commit-options 
      '("--stat"
	"--dirstat"
	"--find-renames"
	"--find-copies"))
