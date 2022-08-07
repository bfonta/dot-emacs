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

;; Enable smooth scrolling strating from emacs-29
(when (and (display-graphic-p)
	   (fboundp 'pixel-scroll-precision-mode)
	   (not (version< emacs-version "29.0")))
  (pixel-scroll-precision-mode 1)
  (setq pixel-scroll-precision-large-scroll-height 40.0)
  (setq pixel-scroll-precision-interpolation-factor 30))

(provide 'cust_scroll)
;;; cust_scroll ends here