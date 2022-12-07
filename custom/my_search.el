;;; my_search --- Summary
;;; Code:
;;; Commentary:

(add-hook 'isearch-mode-hook (apply-partially #'hl-line-mode +1))
(add-hook 'isearch-mode-end-hook (apply-partially #'hl-line-mode -1))

(use-package swiper-helm
  :ensure t
  :requires helm
  :config
  (setq swiper-helm-display-function 'helm-default-display-buffer)
  (global-set-key (kbd "M-s s") 'swiper-helm)
  (setq case-fold-search t)
  ;; colors can be changed with `customize-group ivy-faces` in 'Swiper Line Face'
  )

(provide 'my_search)
;;; my_search ends here
