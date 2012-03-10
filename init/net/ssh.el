;;
;; ssh mode
;;

(require 'ssh)
(require 'proc-filters)
(add-hook 'ssh-mode-hook
	  (function
	   (lambda ()
	     (setq comint-process-echoes t)
	     (add-hook 'comint-ouput-filter-functions 
		       'comint-watch-for-password-prompt))))
(add-hook 'comint-output-filter-functions 'proc-filter-shell-output-filter)
