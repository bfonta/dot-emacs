;;; -*- lexical-binding: nil; -*-

;;; my_copilot --- Summary
;;; Code:
;;; Commentary: https://robert.kra.hn/posts/2023-02-22-copilot-emacs-setup/

(use-package copilot
  :quelpa (copilot :fetcher github
                   :repo "copilot-emacs/copilot.el"
                   :branch "main"
                   :files ("*.el"))
  :config
  (add-hook 'prog-mode-hook 'copilot-mode)  
  )

;;;###autoload
(defun my/no-copilot-mode ()
  "Helper for `my/no-copilot-modes'."
  (copilot-mode -1))

(defvar my/no-copilot-modes '(shell-mode
                              inferior-python-mode
                              eshell-mode
                              term-mode
                              vterm-mode
                              comint-mode
                              compilation-mode
                              debugger-mode
                              dired-mode-hook
                              compilation-mode-hook
                              flutter-mode-hook
                              minibuffer-mode-hook)
  "Modes in which copilot is inconvenient.")

(defun my/copilot-disable-predicate ()
  "When copilot should not automatically show completions."
  (or my/copilot-manual-mode
      (member major-mode my/no-copilot-modes)
      (company--active-p)))

(add-to-list 'copilot-disable-predicates #'my/copilot-disable-predicate)

(defvar my/copilot-manual-mode nil
  "When `t' will only show completions when manually triggered, e.g. via M-S-<return>.")

(defun my/copilot-change-activation ()
  "Switch between three activation modes:
- automatic: copilot will automatically overlay completions
- manual: you need to press a key (M-S-<return>) to trigger completions
- off: copilot is completely disabled."
  (interactive)
  (if (and copilot-mode my/copilot-manual-mode)
      (progn
        (message "deactivating copilot")
        (global-copilot-mode -1)
        (setq my/copilot-manual-mode nil))
    (if copilot-mode
        (progn
          (message "activating copilot manual mode")
          (setq my/copilot-manual-mode t))
      (message "activating copilot mode")
      (global-copilot-mode))))

(define-key global-map (kbd "M-S-<escape>") #'my/copilot-change-activation)

(defun my/copilot-complete-or-accept ()
  "Command that either triggers a completion or accepts one if one
is available. Useful if you tend to hammer your keys like I do."
  (interactive)
  (if (copilot--overlay-visible)
      (progn
        (copilot-accept-completion)
        (open-line 1)
        (next-line))
    (copilot-complete)))

(define-key copilot-mode-map (kbd "M-S-<right>") #'copilot-next-completion)
(define-key copilot-mode-map (kbd "M-S-<left>") #'copilot-previous-completion)
(define-key copilot-mode-map (kbd "M-S-<up>") #'copilot-accept-completion-by-word)
(define-key copilot-mode-map (kbd "M-S-<down>") #'copilot-accept-completion-by-line)
(define-key global-map (kbd "M-S-<return>") #'my/copilot-complete-or-accept)

(defun my/copilot-backtab ()
  "Backtab command that will complet with copilot if a completion is
available. Otherwise will try company, yasnippet or normal
tab-indent."
  (interactive)
  ;; (cond ((or (eq major-mode 'shell-mode)
  ;; 		  (eq major-mode 'minibuffer-mode-hook))
  ;; 		 (completion-at-point))
  ;; 		((eq major-mode 'org-mode)
  ;; 		 (org-cycle))
  ;; 		((eq major-mode 'python-mode)
  ;; 		 (org-cycle))
  ;; 		(t (copilot-accept-completion)
  ;;     	    ;(company-yasnippet-or-completion) ;I'm using M-<tab> for yasnippets
  ;; 		   (indent-for-tab-command)
  ;; 		  ))
  (copilot-accept-completion)
)

(define-key global-map (kbd "S-<iso-lefttab>") #'my/copilot-backtab)

(defun my/copilot-quit ()
  "Run `copilot-clear-overlay' or `keyboard-quit'. If copilot is
cleared, make sure the overlay doesn't come back too soon."
  (interactive)
  (condition-case err
      (when copilot--overlay
        (lexical-let ((pre-copilot-disable-predicates copilot-disable-predicates))
          (setq copilot-disable-predicates (list (lambda () t)))
          (copilot-clear-overlay)
          (run-with-idle-timer
           1.0
           nil
           (lambda ()
             (setq copilot-disable-predicates pre-copilot-disable-predicates)))))
    (error handler)))

(advice-add 'keyboard-quit :before #'my/copilot-quit)

(provide 'my_copilot)
;;; my_copilot ends here
