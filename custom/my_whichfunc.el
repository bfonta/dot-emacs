;;; my_whichfunc --- Summary
;;; Code:
;;; Commentary:

(use-package which-func
  )

(setq which-func-modes '(emacs-lisp-mode c++-mode python-mode)
	  which-func-unknown "----") ;; replace nothing found symbol "???"

(provide 'my_whichfunc)
;;; my_whichfunc ends here
