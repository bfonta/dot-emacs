;;; -*- lexical-binding: nil; -*-

;;; my_theme --- Summary
;;; Code:
;;; Commentary: define and modify the color theme

(use-package zenburn-theme
  :ensure
  :config
  (setq zenburn-override-colors-alist
	'(("zenburn-bg" . "gray14")))
  (load-theme 'zenburn t)
  )

(provide 'my_theme)
;;; my_theme ends here
