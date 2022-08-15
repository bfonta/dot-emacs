;;; my_search --- Summary
;;; Code:
;;; Commentary:

(add-hook 'isearch-mode-hook (apply-partially #'hl-line-mode +1))
(add-hook 'isearch-mode-end-hook (apply-partially #'hl-line-mode -1))

(use-package swiper-helm
  :ensure t
  :requires helm
  :bind (("M-s s" . swiper-helm))
  :config
  (setq swiper-helm-display-function 'helm-default-display-buffer)
  ;; colors can be changed with `customize-group ivy-faces` in 'Swiper Line Face'
  )

(provide 'my_search)
;;; my_search ends here
