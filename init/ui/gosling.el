;;;
;;; After all these years, I still can't get by without these
;;; holdovers from Gosling Emacs.
;;;

(defun rdh::scroll-down-one-line (&optional arg)
  "Scroll text of current window down ARG lines; or 1 line if no ARG."
  (interactive "P")
  (scroll-down (if arg (prefix-numeric-value arg) 1)))

(defun rdh::scroll-up-one-line (&optional arg)
  "Scroll text of current window up ARG lines; or 1 line if no ARG."
  (interactive "P")
  (scroll-up (if arg (prefix-numeric-value arg) 1)))

(global-set-key [(meta ?z)]    'rdh::scroll-down-one-line)
(global-set-key [(control ?z)] 'rdh::scroll-up-one-line)

