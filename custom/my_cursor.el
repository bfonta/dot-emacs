;;; -*- lexical-binding: nil; -*-

;;; my_cursor --- Summary
;;; Code:
;;; Commentary:

(setq-default cursor-type 'box)
(blink-cursor-mode 0)

;; change cursor for all frames
(add-to-list 'default-frame-alist '(cursor ((t (:background "gainsboro" :foreground "black" :weight heavy)))))

(provide 'my_cursor)
;;; my_cursor ends here
