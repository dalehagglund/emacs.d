;;; mail and new setup

(setq mail-user-agent 'message-user-agent
      mail-host-address "gmail.com"
      compose-mail-check-user-agent-warnings nil
      user-mail-address	"dale.hagglund@gmail.com"
      rmail-confirm-expunge nil)       ; I don't use rmail, but . . . 

(defvar rdh:bcc-to-self t 
  "T enables  bcc'ing each outgoing mail to `user-mail-address'.")
(defun rdh:add-self-bcc-header ()
  (when rdh:bcc-to-self
    (save-excursion
      (goto-char (point-min))
      (search-forward mail-header-separator nil t)
      (beginning-of-line)
      (insert
       (concat "Bcc: " user-mail-address "\n")))))

(add-hook 'message-setup-hook 'rdh:add-self-bcc-header)
(add-hook 'message-setup-hook 'bbdb-define-all-aliases)
(setq message-courtesy-message nil)
