;;; my_colors --- Summary
;;; Code:
;;; Commentary:

(use-package ansi-color
  :ensure t
  :config
  (defun display-ansi-colors ()
	(interactive)
	(ansi-color-apply-on-region (point-min) (point-max)))
  )

(use-package rainbow-delimiters
  :ensure t
  :defer t
  :hook (prog-mode . rainbow-delimiters-mode))

;; active region color
(set-face-attribute 'region nil :background "#666" :foreground "#ffffff")

(provide 'my_colors)
;;; my_colors ends here
