;;; my_windows --- Summary
;;; Code:
;;; Commentary: go back and forth between buffer displays

(winner-mode 1)

(set-face-foreground 'vertical-border "gray35")
(fringe-mode '(2 . 2)) ;; left/right widths
(set-face-attribute 'fringe nil :background nil)

(provide 'my_windows)
;;; my_windows ends here
