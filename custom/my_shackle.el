;;; cust_shackle --- Summary
;;; Code:
;;; Commentary: controls how buffers are mapped to windows

(use-package shackle
  :defer t
  :custom
  (shackle-rules '(("^\\*?shell.*" :regexp t :size 1.  :same t)
				   ("*grep*" :regexp nil :size 0.5 :align 'below)
				   ("*Help*" :regexp nil :size 0.3 :align 'below :select t)
				   (".*\\.gz" :regexp t :size 1. :same t)
				   ("\\*swiper\\*" :regexp t :size .25 :align 'below :select t)
				   ("^.*Man.*$" :regexp t :size 1. :same t)
				   ("^.*Proced.*$" :regexp t :size 1. :same t)
				   ("^.*Occur.*$" :regexp t :size 0.25 :align 'below :select t)
				   ;; ("^.*\\.pdf" :regexp t :size 0.35 :align 'right :select t)
				   ("^.*magit.*$" :regexp t :size 1. :same t)
				   ("^.*Completions.*$" :regexp t :size 0.25 :align 'below :select nil)
		   ))
  (shackle-default-rule :regexp nil :size 0.3 :align 'below :select t)
  (shackle-mode 1)
  )

(provide 'cust_shackle)
;;; cust_shackle ends here
