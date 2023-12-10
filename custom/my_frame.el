;;; my_frame --- Summary
;;; Code:
;;; Commentary:

(add-hook 'after-make-frame-functions #'toggle-frame-fullscreen)

;;;###autoload
(defun my/adjust-font-size-new-frame (frame)
  "Inspired by https://emacs.stackexchange.com/a/44930/17066.
Issue: It seems width-px is picked from the previous frame an action was performed... (nth 3 (nth 1 (car (display-monitor-attributes-list))))"
  (let ((width-px (nth 3 (nth 1 (frame-monitor-attributes)))))
	(when (eq width-px 1024) ;; Home
	  (set-face-attribute 'default t :height 120))
	(when (eq width-px 2560) ;; TP
	  (set-face-attribute 'default t :height 220))
	)
  )
(add-hook 'after-make-frame-functions #'my/adjust-font-size-new-frame)

(defun my/run-dired-on-frame-creation (frame)
  "Run dired when a new frame is created."
  (select-frame frame)
  (dired "~/"))
(add-hook 'after-make-frame-functions #'my/run-dired-on-frame-creation)

(setq frame-title-format
  '("" invocation-name ": "(:eval (if (buffer-file-name)
                (abbreviate-file-name (buffer-file-name))
                  "%b"))))

(provide 'my_frame)
;;; my_frame ends here
