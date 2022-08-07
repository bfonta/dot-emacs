;;; my_lisp --- Summary
;;; Code:
;;; Commentary:

(use-package slime
  :defer t
  :config
  (add-to-list 'slime-contribs 'slime-repl)
  (setq inferior-lisp-program "/usr/bin/sbcl")
  )
			 
(provide 'my_lisp)
;;; my_lisp ends here
