;;; use message-mode for composing messages

(setq mail-user-agent 'message-user-agent
      message-courtesy-message nil)

(defvar rdh:bcc-to-self t 
  "T bcc's each outgoing mail to `user-mail-address'.")
(defun rdh:add-self-bcc-header ()
  (when rdh:bcc-to-self
    (save-excursion
      (goto-char (point-min))
      (search-forward mail-header-separator nil t)
      (beginning-of-line)
      (insert
       (concat "Bcc: " user-mail-address "\n")))))

(add-hook 'message-setup-hook 'rdh:add-self-bcc-header)
(eval-after-load "mail/bbdb"
  '(add-hook 'message-setup-hook 'bbdb-define-all-aliases))
