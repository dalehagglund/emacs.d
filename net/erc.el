;;
;; erc
;;

(require 'erc)
(require 'erc-fill)

(define-key erc-mode-map [(control a)] 'erc-bol)
(setq erc-server-history-list
      '("irc.openprojects.net"
	"irc.mpla.ca"))
