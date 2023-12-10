;;; my_startup --- Summary
;;; Code:
;;; Commentary:

(setq inhibit-startup-screen t
	  custom-file (expand-file-name "custom.el" user-emacs-directory)
	  )

;;;###autoload
(defun my/adjust-font-size-start-up ()
  "Font size adjustment. Inspired by https://emacs.stackexchange.com/a/44930/17066"
  (let ((width-px (nth 3 (nth 1 (frame-monitor-attributes)))))
	(when (eq width-px 1024) ;; Home
	  (set-face-attribute 'default nil :height 110))
	(when (eq width-px 2560) ;; TP, Germany
	  (set-face-attribute 'default nil :height 135))
	)
  )

;; To be understood: this runs after calling load-emacs()
(dolist (fn '(toggle-frame-fullscreen
			  (lambda() (dired ".")) ;; run dired on current folder at start-up
			  my/adjust-font-size-start-up
			  (lambda() (load custom-file)) ;; load content added by customize
			  ))
  (add-hook 'after-init-hook fn)
  ;;(add-hook 'after-make-frame-functions 'fn)
  )

(provide 'my_startup)
;;; my_startup ends here
