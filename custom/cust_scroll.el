;;; cust_scroll --- Summary
;;; Code:
;;; Commentary:

(use-package smooth-scrolling
  :config
  (smooth-scrolling-mode 1)
  (setq smooth-scroll-margin 10)
  (toggle-scroll-bar -1)

  (defun my/disable-scroll-bars (frame)
	(modify-frame-parameters frame
							 '((vertical-scroll-bars . nil)
                               (horizontal-scroll-bars . nil))))
  (add-hook 'after-make-frame-functions 'my/disable-scroll-bars)
  )

(provide 'cust_scroll)
;;; cust_scroll ends here
