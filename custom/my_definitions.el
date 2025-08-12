;;; -*- lexical-binding: nil; -*-

;;; my_definitions --- Summary
;;; Code:
;;; Commentary:

(use-package zenburn-theme
  ;; adding here all definitions that do not clearly belong to any package
  :init
  (global-display-line-numbers-mode 0)
  
  (menu-bar-mode -1)
  (toggle-scroll-bar -1)
  ;; This is about 0.1 seconds faster than running
  ;; (tool-bar-mode -1)
  (push '(tool-bar-lines . 0) default-frame-alist)

  (put 'scroll-left 'disabled nil)
  (put 'upcase-region 'disabled nil)
  (put 'downcase-region 'disabled nil)

  ;;move between frames
  (windmove-default-keybindings)

  (add-to-list 'auto-mode-alist '("\\.cu\\'" . c++-mode))
  (add-to-list 'auto-mode-alist '("\\.cuh\\'" . c++-mode))
  (add-to-list 'auto-mode-alist '("\\.hip\\'" . c++-mode))

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

;;;###autoload
(defun my-show-file-name ()
  "Show the full path file name in the minibuffer and clipboard"
  (interactive)
  (kill-new (buffer-file-name))
  (message (buffer-file-name)))
(defalias 'pwd 'my-show-file-name)

(global-set-key (kbd "C-x w") 'comint-send-invisible)

(provide 'my_definitions)
;;; my_definitions.el ends here
