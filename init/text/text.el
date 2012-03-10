;;
;; text mode
;;

(defun rdh::text-mode-hook ()
  (define-key text-mode-map "\d" 'backward-delete-char-untabify)
  (filladapt-mode t)
  (setq indent-tabs-mode nil))
  
(add-hook 'text-mode-hook 'rdh::text-mode-hook)
(toggle-text-mode-auto-fill)
(autoload 'numbered-outline-mode "numbered-outline" nil t)
