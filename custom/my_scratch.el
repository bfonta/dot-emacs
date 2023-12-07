;;; my_scratch --- Summary
;;; Code:
;;; Commentary: 

(setq initial-scratch-message "")

;; The following replaces the above message by the contents of the 'scratch.txt' file
;; (let ((filename (concat user-emacs-directory "scratch.txt")))
;;   (when (file-exists-p filename)
;;     (let ((scratch-buf (get-buffer "*scratch*")))
;;       (when scratch-buf
;;         (with-current-buffer scratch-buf
;;           (erase-buffer)
;;           (insert-file-contents filename))))))

(provide 'my_scratch)
;;; my_scratch ends here
