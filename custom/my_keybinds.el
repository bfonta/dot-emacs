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

;; define keybinds to scroll up and down with the keyboard
(setq scroll-preserve-screen-position 'always)
(defvar my-ctl-x-transient-map (make-sparse-keymap)
  "Transient keymap for C-x arrow keys.")
(define-key my-ctl-x-transient-map (kbd "<down>")  (lambda () (interactive) (scroll-up 1)))
(define-key my-ctl-x-transient-map (kbd "<up>") (lambda () (interactive) (scroll-down 1)))
(defun my/scroll-up-down ()
  "Activate transient keymap for C-x arrow keys."
  (interactive)
  (set-transient-map my-ctl-x-transient-map t))
(define-key ctl-x-map (kbd "<up>") 'my/scroll-up-down)
(define-key ctl-x-map (kbd "<down>") 'my/scroll-up-down)


(global-set-key (kbd "<mouse-3>") 'winner-undo)
(global-set-key (kbd "<down-mouse-3> <mouse-3>") 'winner-undo)

;; swap super and meta keys
(setq x-meta-keysym 'meta
      x-super-keysym 'super)

(defvar my/swap-super-meta nil
  "Variable to keep track of whether super and meta keys are swapped.")
(defun my/toggle-super-meta ()
  "Swaps the super and meta keys."
  (interactive)
  (setq my/swap-super-meta (not my/swap-super-meta))
  (if my/swap-super-meta
      (progn
        (setq x-meta-keysym 'meta
              x-super-keysym 'super)
        (message "Super and Meta keys swapped."))
    (progn
      (setq x-meta-keysym 'super
            x-super-keysym 'meta)
      (message "Super and Meta keys restored."))))

(provide 'my_keybinds)
;;; my_keybinds ends here
