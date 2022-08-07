;;; cust_cursor --- Summary
;;; Code:
;;; Commentary:

(setq-default cursor-type 'box)
(blink-cursor-mode 0)

;; change cursor color
(add-to-list 'default-frame-alist '(cursor-color . "grey50"))

(provide 'cust_cursor)
;;; cust_cursor ends here
