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
  (setq case-fold-search t)
  ;; colors can be changed with `customize-group ivy-faces` in 'Swiper Line Face'
  )
(global-set-key (kbd "M-s s") 'swiper-helm)

;; Kill text when doing incremental search
(defun my/isearch-kill-result ()
  "https://stackoverflow.com/questions/11943285/how-can-i-most-quickly-edit-the-text-highlighted-by-incremental-search"
  (interactive)
  (if (use-region-p)
      (call-interactively 'kill-region)
    (kill-region (point) isearch-other-end))
  (isearch-exit))
(define-key isearch-mode-map [(control f)] 'my/isearch-kill-result)

(provide 'my_search)
;;; my_search ends here
