;;; my_whichfunc --- Summary
;;; Code:
;;; Commentary:

(use-package which-func
  :config
  (setq which-func-modes '(emacs-lisp-mode c++-mode python-mode))
  ;; replace nothing found symbol "???"
  (setq which-func-unknown "-- ∅ --")
  (setq mode-line-format (delete (assoc 'which-func-mode
                                      mode-line-format) mode-line-format)
      which-func-header-line-format '(which-func-mode ("" which-func-format)))
  )

(provide 'my_whichfunc)
;;; my_whichfunc ends here
