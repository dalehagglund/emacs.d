;;
;; bbdb -- insidious big brother database
;;

(add-to-list 'load-path (concat lisp-home "bbdb-2.32"))
(setq bbdb-default-area-code 780)

(require 'bbdb)
(require 'message)
(bbdb-initialize 'gnus 'message 'sendmail)
(add-hook 'gnus-startup-hook 'bbdb-insinuate-gnus)
;;(add-hook 'mail-setup-hook   'bbdb-insinuate-sendmail)
(bbdb-insinuate-message)
(bbdb-insinuate-sc)
(setq bbdb-completion-type 'primary-or-name
      bbdb-complete-name-allow-cycling t
      bbdb-dwim-net-address-allow-redundancy nil)
