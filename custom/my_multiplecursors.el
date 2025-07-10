;;; -*- lexical-binding: nil; -*-

;;; my_multiplecursors --- Summary
;;; Code:
;;; Commentary:

(use-package multiple-cursors
  :config
  (global-set-key (kbd "C-.") 'mc/edit-lines)
  (global-set-key (kbd "C-,") 'mc/mark-all-like-this)
  (global-set-key (kbd "C-c C-.") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-c C-,") 'mc/mark-previous-like-this)
  )

(provide 'my_multiplecursors)
