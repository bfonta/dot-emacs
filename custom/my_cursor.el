;;; my_cursor --- Summary
;;; Code:
;;; Commentary:

(setq-default cursor-type 'box)
(blink-cursor-mode 0)

;; change cursor color
(add-to-list 'default-frame-alist '(cursor-color . "gray75"))

(provide 'my_cursor)
;;; my_cursor ends here
