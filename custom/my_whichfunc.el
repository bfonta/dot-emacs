;;; my_whichfunc --- Summary
;;; Code:
;;; Commentary:

(use-package which-func
  :config
  (setq which-func-modes '(emacs-lisp-mode c++-mode python-mode))
  (setq which-func-unknown "----") ;; replace nothing found symbol "???"
  )

(provide 'my_whichfunc)
;;; my_whichfunc ends here
