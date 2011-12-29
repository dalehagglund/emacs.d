;;
;; more emacs-like w3m keybindings.
;; from http://www.emacswiki.org/cgi-bin/wiki/WThreeMKeymap, 21 Oct 2006
;;

(setq rdh::w3m-path (concat lisp-home "w3m/"))

(add-to-list 'load-path rdh::w3m-path)
(add-to-list 'Info-default-directory-list 
	     (concat rdh::w3m-path "doc"))

(require 'w3m-load)

(setq rdh::w3m-keymap (make-keymap))
(let ((map rdh::w3m-keymap))
  (suppress-keymap map)

  ;; motion within the page
  (define-key map "\C-a" 'w3m-beginning-of-line)
  (define-key map "\C-e" 'w3m-end-of-line)
  (define-key map " " 'scroll-up)
  (define-key map [backspace] 'w3m-scroll-down-or-previous-url)
  (define-key map [delete] 'w3m-scroll-down-or-previous-url)
  (define-key map "\C-?" 'w3m-scroll-down-or-previous-url)
  (define-key map "\t" 'w3m-next-anchor)
  (define-key map [tab] 'w3m-next-anchor)
  (define-key map [(shift tab)] 'w3m-previous-anchor)
  (define-key map [(shift iso-lefttab)] 'w3m-previous-anchor)
  (define-key map "n" 'w3m-next-anchor)
  (define-key map "p" 'w3m-previous-anchor)
  (define-key map "]" 'w3m-next-form)
  (define-key map "[" 'w3m-previous-form)
  (define-key map "}" 'w3m-next-image)
  (define-key map "{" 'w3m-previous-image)
  (define-key map ">" (lambda (arg)
			(interactive "P")
			(let ((shift (or (and arg (prefix-numeric-value arg))
					 (/ (window-width) 3))))
			  (scroll-left shift))))
  (define-key map "<" (lambda (arg)
			(interactive "P")
			(let ((shift (or (and arg (prefix-numeric-value arg))
					 (/ (window-width) 3))))
			  (scroll-right shift))))

  ;; meta information about the page being displayed
  (define-key map "c" 'w3m-print-this-url)
  (define-key map "C" 'w3m-print-current-url)
  (define-key map "=" 'w3m-view-header)
  (define-key map "\\" 'w3m-view-source)

  ;; motion between pages
  (define-key map "H" 'w3m-gohome)
  (define-key map "g" 'w3m-goto-url)
  (define-key map "G" 'w3m-goto-url-new-session)
  (define-key map "^" 'w3m-view-parent-page)
  (define-key map "\M-n" 'w3m-view-next-page)
  (define-key map "\M-p" 'w3m-view-previous-page)
  (define-key map "\C-m" 'w3m-view-this-url)
  (define-key map [(shift return)] 'w3m-view-this-url-new-session)
  (define-key map [(shift kp-enter)] 'w3m-view-this-url-new-session)
  (define-key map [(button2)] 'w3m-mouse-view-this-url)
  (define-key map [(shift button2)] 'w3m-mouse-view-this-url-new-session)

  ;; using an external browser
  (define-key map "M" 'w3m-view-url-with-external-browser)

  ;; tab control
  (define-key map "\C-c\C-t" 'w3m-copy-buffer)
  (define-key map "\C-c\C-p" 'w3m-previous-buffer)
  (define-key map "\C-c\C-n" 'w3m-next-buffer)
  (define-key map "\C-c\C-w" 'w3m-delete-buffer)
  (define-key map "\C-c\M-w" 'w3m-delete-other-buffers)
  (define-key map "\C-c\C-s" 'w3m-select-buffer)
  (define-key map "\C-c\C-a" 'w3m-switch-buffer)

  ;; bookmarks
  (define-key map "a" 'w3m-bookmark-add-current-url)
  (define-key map "\M-a" 'w3m-bookmark-add-this-url)
  (define-key map "v" 'w3m-bookmark-view)

  ;; antenna
  (define-key map "+" 'w3m-antenna-add-current-url)
  (define-key map "A" 'w3m-antenna)

  ;; download
  (define-key map "d" 'w3m-download)
  (define-key map "D" 'w3m-download-this-url)
  (define-key map "\M-i" 'w3m-save-image)

  ;; miscellaneous bindings

  (define-key map "h" 'describe-mode)
  (define-key map "I" 'w3m-toggle-inline-images)

  (define-key map "N" 'w3m-namazu)
  (define-key map "o" 'w3m-history)
  (define-key map "O" 'w3m-db-history)
  (define-key map "q" 'w3m-close-window)
  (define-key map "Q" 'w3m-quit)
  (define-key map "R" 'w3m-reload-this-page)
  (define-key map "r" 'w3m-redisplay-this-page)
  (define-key map "s" 'w3m-search)

;;  (define-key map "W" 'w3m-weather)
  (define-key map "?" 'describe-mode)

  (define-key map "\C-c\C-b" 'report-emacs-w3m-bug)
  (define-key map "\C-c\C-c" 'w3m-submit-form)
  (define-key map "\C-c\C-k" 'w3m-process-stop)
)

(add-hook 'w3m-mode-hook '(lambda () (use-local-map rdh::w3m-keymap)))
