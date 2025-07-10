;;; -*- lexical-binding: nil; -*-

;;; my_scratch --- Summary
;;; Code:
;;; Commentary: 

;; The following replaces the above message by the contents of the 'scratch.txt' file
;; (let ((filename (concat user-emacs-directory "scratch.txt")))
;;   (when (file-exists-p filename)
;;     (let ((scratch-buf (get-buffer "*scratch*")))
;;       (when scratch-buf
;;         (with-current-buffer scratch-buf
;;           (erase-buffer)
;;           (insert-file-contents filename))))))
(setq initial-scratch-message "")

;; make the scratch follow org syntax
(setq initial-major-mode 'org-mode)

(provide 'my_scratch)
;;; my_scratch ends here
