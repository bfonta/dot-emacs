;;; my_shell --- Summary
;;; Code:
;;; Commentary:

(use-package xterm-color
  :defer t
  )

(use-package bash-completion
  :init
  (when window-system
	(add-hook 'emacs-startup-hook #'shell)
	(savehist-mode))

  (add-hook 'shell-mode-hook
			(lambda ()
              ;; Disable font-locking in this buffer to improve performance
              (font-lock-mode -1)
              ;; Prevent font-locking from being re-enabled in this buffer
              (make-local-variable 'font-lock-function)
              (setq font-lock-function (lambda (_) nil))
              (add-hook 'comint-preoutput-filter-functions 'xterm-color-filter nil t)))
  
  :config
  (bash-completion-setup)

  ;; Disable company mode in shells
  (defun my-shell-mode-setup-function ()
	;; if (file-xremote-p default-directory)
	;;    (progn (helm-mode +1) (company-mode -1))
	(helm-mode +1)
	(when (fboundp 'company-mode)
      (company-mode -1)
      ;; (define-key company-active-map (kbd "<tab>") #'company-complete-selection)
      ))
  (add-hook 'shell-mode-hook 'my-shell-mode-setup-function)

  ;; https://github.com/daviwil/emacs-from-scratch/blob/master/show-notes/Emacs-09.org
  (setq comint-output-filter-functions
		(remove 'ansi-color-process-output comint-output-filter-functions))

  (setq explicit-shell-file-name "/bin/bash")
  (setq history-delete-duplicates t)
  (setq comint-input-ignoredups t)

  (defun do-not-ask-just-kill-buffer ()
    (setq kill-buffer-query-functions
		  (delq 'process-kill-buffer-query-function kill-buffer-query-functions))
    )
  (add-hook 'shell-mode-hook 'do-not-ask-just-kill-buffer)
  )

(defun my/debian-update ()
  "Runs apt update and upgrade commands."
  (interactive)
  (insert (concat "sudo apt update && "
			 "sudo apt upgrade -y && "
			 "sudo apt full-upgrade -y && "
			 "sudo apt autoremove -y "))
  (comint-send-input)
  )

(provide 'my_shell)
;;; my_shell ends here
