;;; my_perspective --- Summary
;;; Code: https://github.com/Bad-ptr/persp-mode.el
;;; Commentary: perspective + multiple frames; persp-keymap-prefix is set to M-<up> in custom.el

(use-package persp-mode
  :ensure t
  :bind
  ("C-x C-b" . persp-list-buffers) ; override default buffer switcher
  :config
  (with-eval-after-load "persp-mode-autoloads"
	(setq wg-morph-on nil) ;; switch off animation
	(setq persp-autokill-buffer-on-remove 'kill-weak)
	(add-hook 'window-setup-hook #'(lambda () (persp-mode 1))))
  )
