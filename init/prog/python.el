;;
;; python
;;
(autoload 'python-mode "python-mode" "Python mode" t)
(add-to-list 'auto-mode-alist '("\\.py$" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))
(add-to-list 'interpreter-mode-alist '("python2" . python-mode))

(require 'nose)

(defun rdh::python-mode-hook ()
  (define-key py-mode-map [(meta f)] 'py-forward-into-nomenclature)
  (define-key py-mode-map [(meta b)] 'py-backward-into-nomenclature)
  (define-key py-mode-map [(meta d)] 'py-kill-word-into-nomenclature)

  (local-set-key "\C-ca" 'nosetests-all)
  (local-set-key "\C-cm" 'nosetests-module)
  (local-set-key "\C-c." 'nosetests-one)

  (local-set-key "\C-c\C-a" 'nosetests-all)
  (local-set-key "\C-c\C-m" 'nosetests-module)

  (local-set-key "\C-cpa" 'nosetests-pdb-all)
  (local-set-key "\C-cpm" 'nosetests-pdb-module)
  (local-set-key "\C-cp." 'nosetests-pdb-one)

  (local-set-key "\C-c\C-p\C-a" 'nosetests-pdb-all)
  (local-set-key "\C-c\C-p\C-m" 'nosetests-pdb-module)
  (local-set-key "\C-c\C-p." 'nosetests-pdb-one))


(add-hook 'python-mode-hook 'rdh::python-mode-hook)
(setq nose-project-names nil
      nose-use-verbose nil)
