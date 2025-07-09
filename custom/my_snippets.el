;;; my_snippets --- Summary
;;; Code:
;;; Commentary:
(use-package yasnippet
  :ensure t
  :commands (yas-load-directory)

  :config
  (add-to-list 'load-path "~/dot-emacs/yasnippet-0.13.0/")
  (yas-global-mode 1)
)

(yas-minor-mode 1)
(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-minor-mode-map (kbd "<M-tab>") 'yas-expand)
(define-key yas-minor-mode-map (kbd "<C-tab>") 'yas-expand)

(provide 'my_snippets)
;;; my_snippets.el ends here
