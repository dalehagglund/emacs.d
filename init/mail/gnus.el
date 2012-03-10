;;;
;;; gnus stuff
;;;

(require 'rx)

(setq gnus-simplify-ignored-prefixes
      (rx bol
	  (or 
	   (seq "[" (1+ (char upper "_")) "]")
	   "FW:"
	   "Canceled:"
	   "Updated:"
	   )
	  (0+ blank)))

(setq rdh::subject-simplifiers
      (list (cons (rx bol
		      "CSE "
		      (or "zeph" 
			  "fabx_etc")
		      ": ["
		      (submatch wordchar (1+ digit))
		      (any ".,]")
		      (0+ anything)
		      eol)
		  "\\1")))

(defun rdh::current-article-header ()
  (gnus-summary-article-header
   (gnus-summary-article-number)))
	   
(defun rdh::current-article-author ()
  (let* ((from (mail-header-parse-address
		(mail-header-from (rdh::current-article-header))))
	 (mailbox (car from))
	 (name (cdr from)))
  (or name mailbox)))

(defun rdh::current-article-subject ()
  (mail-header-subject (rdh::current-article-header)))

(defun rdh::simplify-article-subject (&optional subject)
  (or subject
      (setq subject (rdh::current-article-subject)))
  (setq subject
	(rdh::iterate-subject-simplifier #'gnus-simplify-subject subject))
  (setq subject 
	(rdh::iterate-subject-simplifier #'rdh::subject-simplifier subject))
  subject)

(defun rdh::subject-simplifier (subj)
  (let ((simp rdh::subject-simplifiers)
	done)
    (while (and simp 
		(not done))
      (if (string-match (caar simp) subj)
	  (setq subj (match-substitute-replacement 
		      (cdar simp) 
		      nil nil subj nil)
		done t))
      (setq simp (cdr simp)))
    subj))

(defun rdh::iterate-subject-simplifier (f subj)
  (let (s done)
    (while (not done)
      (setq s subj
	    subj (funcall f subj)
	    done (or (>= (length subj) (length s))
		     (string-equal s subj))))
    subj))

(defadvice gnus-summary-limit-to-subject
  (before 
   default-regexp-from-message-subject
   (subject &optional header not-matching)
   activate)
  "Take default regular expression from subject line of current article."
  (interactive
   (list 
    (read-string (if current-prefix-arg
		     "Exclude subject (regexp): "
		   "Limit to subject (regexp): ")
		 (rx-to-string (rdh::simplify-article-subject) t))
    nil current-prefix-arg)))

(defadvice gnus-summary-limit-to-author
  (before
   default-author-from-message
   (from &optional not-matching)
   activate)
  "Take default author regexp from From: line of current article"
  (interactive   
   (list 
    (read-string (if current-prefix-arg
		     "Exclude author (regexp): "
		   "Limit to author (regexp): ")
		 (rx-to-string (rdh::current-article-author) t))
    current-prefix-arg)))
