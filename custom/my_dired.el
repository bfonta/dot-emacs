;;; my_dired --- Summary
;;; Code:
;;; Commentary:

(use-package dired
  :ensure nil
  :init
  (require 'dired-x)
  :config
  (global-set-key (kbd "C-x C-f") 'dired-jump)
  (define-key dired-mode-map [?%?h] 'dired-show-only)
  (define-key dired-mode-map (kbd "C-<up>") 'dired-up-directory)
  (define-key dired-mode-map (kbd "S-<return>") 'dired-find-file-other-window)
  (setq dired-deletion-confirmer #'y-or-n-p ;; ls program name
		dired-omit-files (rx (or (seq bol (? ".") "#")
								 (seq bol "." eol)
								 (seq bol "." (+ any) eol)
								 (seq bol ".." eol)
								 (seq bol "#" eol))))
  (add-hook 'dired-mode-hook 'dired-omit-mode))

;;; Sort directories first
;;; https://www.emacswiki.org/emacs/DiredSortDirectoriesFirst
(defun mydired-sort ()
  "Sort dired listings with directories first."
  (save-excursion
    (let (buffer-read-only)
      (forward-line 2) ;; beyond dir. header 
      (sort-regexp-fields t "^.*$" "[ ]*." (point) (point-max)))
    (set-buffer-modified-p nil)))
(defadvice dired-readin
  (after dired-after-updating-hook first () activate)
  "Sort dired listings with directories first before adding marks."
  (mydired-sort))

(use-package dired-sidebar
  :defer t
  :commands (dired-sidebar-toggle-sidebar))

;; https://emacs.stackexchange.com/questions/16891/changing-confirmation-style-when-deleting-files-in-dired
;; Type `y` or `n` without requiring additional `Enter` key press
;; Note that recursive directory deletion hard-codes a yes-or-no-p because it's a more dangerous action.
(defun dired-show-only (regexp)
  (interactive "sFiles to show (regexp): ") 
  (dired-mark-files-regexp regexp) ;; dired %m command
  (dired-toggle-marks) ;; dired *t command
  (dired-do-kill-lines) ;; dired k command
  )

;;press enter only once to enter folder/file after isearch
(add-hook 'isearch-mode-end-hook 
  (lambda ()
    (when (and (eq major-mode 'dired-mode)
			   (not isearch-mode-end-hook-quit)
			   (eq last-input-event 'return)
			   )
      (dired-find-file))))

(provide 'my_dired)
;;; my_dired ends here
