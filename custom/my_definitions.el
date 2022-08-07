;;; my_definitions --- Summary
;;; Code:
;;; Commentary:

;; Font size adjustment
(defun my/adjust-font-size-start-up ()
  "Inspired by https://emacs.stackexchange.com/a/44930/17066"
  (let ((width-px (nth 3 (nth 1 (frame-monitor-attributes)))))
	(when (eq width-px 1024) ;; Home
	  (set-face-attribute 'default t :height 120))
	(when (eq width-px 2560) ;; TP
	  (set-face-attribute 'default t :height 220))
	)
  )
(add-hook 'emacs-startup-hook #'my/adjust-font-size-start-up)

;; (nth 3 (nth 1 (car (display-monitor-attributes-list))))
(defun my/adjust-font-size-new-frame (frame)
  "Inspired by https://emacs.stackexchange.com/a/44930/17066.
Issue: It seems width-px is picked from the previous frame an action was performed..."
  (let ((width-px (nth 3 (nth 1 (frame-monitor-attributes)))))
	(when (eq width-px 1024) ;; Home
	  (set-face-attribute 'default t :height 120))
	(when (eq width-px 2560) ;; TP
	  (set-face-attribute 'default t :height 220))
	)
  )
(add-hook 'after-make-frame-functions #'my/adjust-font-size-new-frame)

(use-package zenburn-theme
  ;; adding here all definitions that do not clearly belong to any package
  :init
  (global-display-line-numbers-mode 0)
  
  (menu-bar-mode -1)
  (toggle-scroll-bar -1)
  (tool-bar-mode -1)

  (cua-mode t)

  (put 'scroll-left 'disabled nil)
  (put 'upcase-region 'disabled nil)
  (put 'downcase-region 'disabled nil)

  ;;move between frames
  (windmove-default-keybindings)

  (add-to-list 'auto-mode-alist '("\\.cu\\'" . c++-mode))
  (add-to-list 'auto-mode-alist '("\\.cuh\\'" . c++-mode))

  (setq visible-bell t) ;;disable noisy bell

  (setq tramp-terminal-type "dumb")

  (setq revert-without-query '(".*"))
  )

(use-package flycheck
  :config
  ;;(add-hook 'after-init-hook #'global-flycheck-mode)
  (add-hook 'c++-mode-hook (lambda () (setq flycheck-gcc-language-standard "c++17")))
  )

(use-package which-key
  :defer t
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.5))

(use-package restart-emacs
  :defer t
  )

(defun my-show-file-name ()
  "Show the full path file name in the minibuffer and clipboard"
  (interactive)
  (kill-new (buffer-file-name))
  (message (buffer-file-name)))
(defalias 'pwd 'my-show-file-name)

(global-set-key (kbd "C-x w") 'comint-send-invisible)

(provide 'my_definitions)
;;; my_definitions.el ends here
