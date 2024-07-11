;;; my_frame --- Summary
;;; Code:
;;; Commentary:

;;;###autoload
(defun my/run-dired-on-frame-creation (frame)
  "Run dired when a new frame is created."
  (select-frame frame)
  (dired "~/"))
(add-hook 'after-make-frame-functions #'my/run-dired-on-frame-creation)

(setq frame-title-format
  '("" invocation-name ": "(:eval (if (buffer-file-nameeviate-file-name (buffer-file-name))
                  "%b"))))

; (add-hook 'after-make-frame-functions #'toggle-frame-fullscreen)

(provide 'my_frame)
;;; my_frame ends here
