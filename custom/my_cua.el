;;; my_cua --- Summary
;;; Code:
;;; Commentary:

(defun my/replace-new-lines (beg end)
  "Replace new lines in buffer or region with spaces."
  (interactive "r")
  (format-replace-strings '(("\n" . " ") ("- " . ""))
                          nil beg end))
(defun my/paste-and-replace ()
  "Paste and replace new lines from the source with spaces."
  (interactive)
  (cua-paste nil)
  (my/replace-new-lines (mark) (point)))

(use-package cua-base
  :config
  (cua-mode t)
  (define-key cua--cua-keys-keymap (kbd "C-x C-x") 'exchange-point-and-mark)
  (define-key cua--cua-keys-keymap (kbd "M-v") 'my/paste-and-replace))

(provide 'my_cua)
;;; my_cua.el ends here
