;;; my_frame --- Summary
;;; Code:
;;; Commentary:

(add-hook 'after-make-frame-functions #'toggle-frame-fullscreen)

;; (nth 3 (nth 1 (car (display-monitor-attributes-list))))
(defun my/adjust-font-size-new-frame (frame)
  "Inspired by https://emacs.stackexchange.com/a/44930/17066.
Issue: It seems width-px is picked from the previous frame an action was performed..."
  (let ((width-px (nth 3 (nth 1 (frame-monitor-attributes)))))
	(when (eq width-px 1024) ;; Home
	  (set-face-attribute 'default t :height 120))
	(when (eq width-px 2560) ;; TP
	  (set-face-attribute 'default t :height 220))
	)
  )
(add-hook 'after-make-frame-functions #'my/adjust-font-size-new-frame)

(provide 'my_frame)
;;; my_frame ends here
