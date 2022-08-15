;;; my_startup --- Summary
;;; Code:
;;; Commentary:

(add-hook 'emacs-startup-hook #'toggle-frame-fullscreen)

;; Font size adjustment
(defun my/adjust-font-size-start-up ()
  "Inspired by https://emacs.stackexchange.com/a/44930/17066"
  (let ((width-px (nth 3 (nth 1 (frame-monitor-attributes)))))
	(when (eq width-px 1024) ;; Home
	  (set-face-attribute 'default t :height 120))
	(when (eq width-px 2560) ;; TP
	  (set-face-attribute 'default t :height 220))
	)
  )
(add-hook 'emacs-startup-hook #'my/adjust-font-size-start-up)

(provide 'my_startup)
;;; my_startup ends here
