;;; ibuffer

(require 'ibuffer)

(defun ibuffer-other-frame (&optional name qualifiers update)
  (interactive))

(define-key ctl-x-5-map [(control ?b)] 'ibuffer-other-frame)
(global-set-key [(control ?x) (control ?b)] 'ibuffer)
(global-set-key [menu-bar buffer list-buffers] 
		'("         List All Buffers" . ibuffer))

