;;; my_search --- Summary
;;; Code:
;;; Commentary:

;; press enter only once in dired to enter folder/file after isearch
(add-hook 'isearch-mode-end-hook 
  (lambda ()
    (when (and (eq major-mode 'dired-mode)
			   (not isearch-mode-end-hook-quit)
			   (eq last-input-event 'return)
			   )
      (dired-find-file))))

;; enable/disable current line highlight after isearch only if not running in dired-mode
;; line highlight is set independently for dired-mode to avoid conflicts
;; originally implemented to avoid turning off the highlight once isearch has finished
(add-hook 'isearch-mode-hook
		  (lambda ()
            (if (not (eq major-mode 'dired-mode))
                (apply-partially #'hl-line-mode +1))))
(add-hook 'isearch-mode-end-hook
		  (lambda ()
            (if (not (eq major-mode 'dired-mode))
                (apply-partially #'hl-line-mode -1))))

(use-package swiper-helm
  :ensure t
  :requires helm
  :config
  (setq swiper-helm-display-function 'helm-default-display-buffer)
  (setq case-fold-search t)
  ;; colors can be changed with `customize-group ivy-faces` in 'Swiper Line Face'
  )
(global-set-key (kbd "M-s s") 'swiper-helm)

;;;###autoload
(defun my/isearch-kill-result ()
  "Kill text when doing incremental search (https://stackoverflow.com/questions/11943285/how-can-i-most-quickly-edit-the-text-highlighted-by-incremental-search)"
  (interactive)
  (if (use-region-p)
      (call-interactively 'kill-region)
    (kill-region (point) isearch-other-end))
  (isearch-exit))
(define-key isearch-mode-map [(control f)] 'my/isearch-kill-result)

(provide 'my_search)
;;; my_search ends here
