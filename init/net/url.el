;;;
;;; url browsing
;;;

(setq browse-url-generic-program "chromium-browser")

(defun rdh::browse-url-with-lynx (url &optional newwindow)
  (interactive (browse-url-interactive-arg "Lynx URL: "))
  (call-process "/usr/home/rdh/bin/xlynx" nil 0 nil url))

(defun rdh::browse-url-with-w3m (url &optional newwindow)
  (interactive (browse-url-interactive-arg "w3m url: "))
  (w3m url))

(global-set-key "\C-cu." 'browse-url-at-point)
(global-set-key "\C-cub" 'browse-url-of-buffer)
(global-set-key "\C-cuf" 'browse-url-of-file)

(setq browse-url-browser-function
      (if window-system 
	  'browse-url-generic 
	'rdh::browse-url-with-w3m))

(add-hook 'dired-mode-hook
	  (lambda ()
	    (local-set-key "\C-cuf" 'browse-url-of-dired-file)))

(if (boundp 'browse-url-browser-function)
    (global-set-key "\C-cuu" browse-url-browser-function)
  (eval-after-load "browse-url"
		   '(global-set-key "\C-cuu" browse-url-browser-function)))
