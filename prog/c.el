;;;
;;; c stuff
;;;

(require 'cc-mode)

(setq c-macro-prompt-flag t)

(c-add-style "rdh" '("cc-mode" 
		     (c-basic-offset . 8)
		     (c-offsets-alist 
		      (substatement-open . 0)
		      (label . 0))))
(c-add-style "yy" 
	     '("cc-mode" 
	       (indent-tabs-mode . nil)
	       (c-basic-offset . 4)
	       (c-offsets-alist
		(substatement-open . 0)
		(label . 0))))

(setq rdh::c-auto-style-alist
      '(
	("snac/cache/" . "gnu")
	("snac/dmg/" . "gnu")
	("stdf/" . "gnu")
	("snac/" . "yy")
	("yy[^/]*/" . "yy")
	("yy.[A-Z-]*/" . "yy")
	(".*"  . "rdh")))

(defun rdh::set-style-for-file ()
  (let ((f (buffer-file-name))
	(a rdh::c-auto-style-alist))
    (while a
      (if (string-match (caar a) f)
	  (progn
	    (c-set-style (cdar a))
	    (setq a nil))
	(setq a (cdr a))))))

(defun rdh::c-mode-common-hook ()
  (rdh::set-style-for-file)
  (c-subword-mode 1))

(setq rdh::lua-api-types
  '("lua_State"
    "lua_CFunction"
    "lua_Number"
    "lua_Integer"
    "lua_Writer"
    "lua_Reader"
    "lua_Debug"
    "lua_Hook"
    "luaL_Buffer"
    "luaL_Reg"))

(mapcar 
 (lambda (type) (add-to-list 'c-font-lock-extra-types type)) 
 rdh::lua-api-types)

(add-hook 'c-mode-common-hook 'rdh::c-mode-common-hook)