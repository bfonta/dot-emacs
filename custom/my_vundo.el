;;; my_vundo --- Summary
;;; Code: https://github.com/casouri/vundo
;;; Commentary: tree undo

(unless (version< emacs-version "28.0")
  (use-package vundo
    :ensure t
    ))

(provide 'my_vundo)
;;; my_vundo.el ends here
