;;; my_windows --- Summary
;;; Code:
;;; Commentary: go back and forth between buffer displays

(winner-mode 1)

(set-face-foreground 'vertical-border "gray35")
(fringe-mode '(2 . 2)) ;; left/right widths
(set-face-attribute 'fringe nil :background nil)

;;;###autoload
(defun my/shrink-window-third ()
  (interactive)
  (shrink-window (round (* (window-width) .333)) t)
  )
(global-set-key (kbd "C-x =") 'my/shrink-window-third)

(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

(provide 'my_windows)
;;; my_windows ends here
