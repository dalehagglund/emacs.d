;; miscellaneous user-interface stuff

(setq visible-bell	t
      next-line-add-newlines nil	; no auto NLs at EOF
      same-window-buffer-names (remq "*mail*" same-window-buffer-names)
      special-display-buffer-names '("*Help*" 
				     "*compilation*" 
				     "*mail*"
				     "*grep*")
      special-display-regexps nil
      scroll-preserve-screen-position t
      line-move-visual		      nil
)

(blink-cursor-mode -1)			; ick!
(tool-bar-mode -1) 
(tooltip-mode -1) 
(transient-mark-mode -1)
(partial-completion-mode 1)

(global-set-key [home] 'beginning-of-buffer) ; transitional binding
(global-set-key [end] 'end-of-buffer)	     ; ditto

(defun toggle-truncate-lines ()
  "Toggle between wrapping lines and truncating lines."
  (interactive)
  (setq truncate-lines (not truncate-lines)))

