;;; -*- lexical-binding: nil -*-

;;; my_keybinds --- Summary
;;; Code:
;;; Commentary:

(global-set-key (kbd "M-r") 'replace-regexp)
(global-set-key (kbd "C-M-r") 'my/batch-replace-strings)
(global-set-key (kbd "M-q") 'align-regexp)
(global-set-key (kbd "M-c") 'goto-line)
(global-set-key (kbd "C-x x") 'exchange-point-and-mark)
(global-set-key (kbd "C-f") 'revert-buffer)
(global-set-key (kbd "M-f") 'rgrep)
(global-set-key (kbd "C-M-f") 'projectile-find-file)
(global-set-key (kbd "C-S-f") 'revert-buffers)
(global-set-key (kbd "C-c o") 'ffap-other-window)

(use-package sudo-edit
  :ensure t
  :init
  (global-set-key (kbd "C-c C-r") 'sudo-edit)
  )

(global-set-key (kbd "M-k") '(lambda () (interactive) (kill-line 0)) ) ;C-u kills to the left

;;;; Use C-u to switch between buffer and frame zoom
(global-set-key (vector (list 'control mouse-wheel-down-event))
                'zoom-in)
(global-set-key (vector (list 'control 'meta mouse-wheel-down-event))
                'zoom-all-frames-in)
(global-set-key (vector (list 'control  mouse-wheel-up-event))
                'zoom-out)
(global-set-key (vector (list 'control 'meta mouse-wheel-up-event))
                'zoom-all-frames-out)
(define-key ctl-x-map [(control ?+)] 'zoom-in/out)
(define-key ctl-x-map [(control ?-)] 'zoom-in/out)
(define-key ctl-x-map [(control ?=)] 'zoom-in/out)
(define-key ctl-x-map [(control ?0)] 'zoom-in/out)

(global-set-key (kbd "<mouse-3>") 'winner-undo)
(global-set-key (kbd "<down-mouse-3> <mouse-3>") 'winner-undo)

;; swap super and meta keys
(setq x-meta-keysym 'super
      x-super-keysym 'meta)

(provide 'my_keybinds)
;;; my_keybinds ends here
