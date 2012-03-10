(require 'promela-mode)

(dolist (re '("\\.spin$" "\\.pml$" "\\.promela$"))
  (add-to-list 'auto-mode-alist (cons re 'promela-mode)))

(setq promela-block-indent 4
      promela-auto-match-delimiter nil
      promela-selection-indent 0)
