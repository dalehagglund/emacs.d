;;
;; python
;;
(autoload 'python-mode "python-mode" "Python mode" t)
(add-to-list 'auto-mode-alist '("\\.py$" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))
(add-to-list 'interpreter-mode-alist '("python2" . python-mode))

(defun rdh::python-mode-hook ()
  (define-key py-mode-map [(meta f)] 'py-forward-into-nomenclature)
  (define-key py-mode-map [(meta b)] 'py-backward-into-nomenclature)
  (define-key py-mode-map [(meta d)] 'py-kill-word-into-nomenclature))

(add-hook 'python-mode-hook 'rdh::python-mode-hook)
