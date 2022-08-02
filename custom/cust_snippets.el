;;; cust_snippets --- Summary
;;; Code:
;;; Commentary:
(use-package yasnippet
  :defer t
  :commands (yas-load-directory)
  :config
  (add-to-list 'load-path "~/.emacs.d/elpa/yasnippet-0.13.0/")
  (yas-global-mode 1)
  (define-key yas-minor-mode-map (kbd "<tab>") nil)
  (define-key yas-minor-mode-map (kbd "TAB") nil)
  (define-key yas-minor-mode-map (kbd "<M-tab>") 'yas-expand)
  )
(provide 'cust_snippets)
;;; cust_snippets.el ends here
