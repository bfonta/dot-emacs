;;; my_yaml --- Summary
;;; Code:
;;; Commentary: Tree-sitter https://www.masteringemacs.org/article/how-to-get-started-tree-sitter

(setq major-mode-remap-alist
	  '((yaml-mode . yaml-ts-mode)))

(use-package yaml-ts-mode
  :init (add-to-list 'auto-mode-alist '("\\.ya?ml\\'" . yaml-ts-mode))
  )
  
(provide 'my_yaml)
;;; my_yaml ends here
