;;;
;;; setup for ido
;;;

(require 'ido)

(setq ido-show-dot-for-dired t
      ido-enable-flex-matching t
      ido-default-buffer-method 'selected-window
      ido-default-file-method 'selected-window
      ido-auto-merge-work-directories-length -1

      ido-max-directory-size 40000)

(ido-mode t)
(ido-everywhere 1)

(setq ido-execute-command-cache nil)
(defun ido-execute-command ()
  (interactive)
  (call-interactively
   (intern
    (ido-completing-read
     "M-x "
     (progn
       (unless ido-execute-command-cache
	 (mapatoms 
	  (lambda (s)
	    (when (commandp s)
	      (setq ido-execute-command-cache
		    (cons (format "%S" s) ido-execute-command-cache))))))
       ido-execute-command-cache)))))
(defun ido-clear-execute-command-cache ()
  (interactive)
  (setq ido-execute-command-cache nil))
    
(add-hook 'ido-setup-hook
          (lambda ()
            (global-set-key "\M-x" 'ido-execute-command)))

