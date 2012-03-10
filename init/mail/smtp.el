;;
;; smtp sending
;;

(require 'smtpmail)
(require 'message)
(setq message-send-mail-function 'message-smtpmail-send-it
      smtpmail-starttls-credentials 
      '(("smtp.gmail.com" 587 nil nil))
      smtpmail-auth-credentials "~/.authinfo.gpg"
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587
)


