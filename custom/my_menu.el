;;; my_menu --- Summary
;;; Code:
;;; Commentary:

(use-package imenu-list
  :config
  (setq imenu-list-focus-after-activation t
		imenu-list-auto-resize t
		imenu-list-after-jump-hook nil)
  )
  
(provide 'my_menu)
;;; my_menu ends here
