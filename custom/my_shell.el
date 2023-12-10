;;; my_shell --- Summary
;;; Code:
;;; Commentary:

(use-package xterm-color
  :defer t
  )

;; requires libtool and libtool-bin
(use-package term
  :config
  (setq explicit-shell-file-name "bash")
  ;; regexp to recognize prompts in the inferior process.
  (setq term-prompt-regexp "^[^#$%>\n]*[#$%>] *") 
  )

(use-package bash-completion
  :init
  (when window-system
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

;;;###autoload
(defun my/debian-update ()
  "Runs apt update and upgrade commands."
  (interactive)
  (let ((buffer "*shell*") (wth (window-total-height)))
	(unless (or (eq major-mode 'shell-mode) (< wth 12) (get-buffer-window buffer t))
	  (split-window-below (round (* -0.35 wth)))
	  (other-window 1))
	(shell buffer)
	(insert (concat "sudo apt update && sudo apt upgrade -y && "
					"sudo apt full-upgrade -y && "
					"sudo apt autoremove -y "))
	(comint-send-input)
	))

;;;###autoload
(defun my/spawn-shell (name)
  "Create new shell buffer"
  (interactive "MName of new shell buffer: shell_")
  (pop-to-buffer (get-buffer-create (generate-new-buffer-name (concat "shell_" name))))
  (shell (current-buffer)))

;;;###autoload
(defun my/spawn-term (name)
  "Create new term buffer"
  (interactive "MName of new shell buffer: term_")
  (pop-to-buffer (get-buffer-create (generate-new-buffer-name (concat "term_" name))))
  (vterm (current-buffer)))

;;;###autoload
(defun my/phonebook (user)
  "Access CERN phonebook info for one user."
  (interactive "MCERN User: ")
  (let ((default-directory (expand-file-name "/ssh:bfontana@lxplus:~/")))
	(with-connection-local-variables
	 (shell-command-to-string (concat "phonebook " user " --all"))
      ))
  (message "Done. Check tramp buffer.")
  )


(provide 'my_shell)
;;; my_shell ends here
