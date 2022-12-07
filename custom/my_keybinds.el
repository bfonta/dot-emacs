;;; my_keybinds --- Summary
;;; Code:
;;; Commentary:

(use-package cua-base
  :config
  (progn
	(define-key cua-global-keymap (kbd "C-x C-x") 'exchange-dot-and-mark)
	)
  )

(global-set-key (kbd "M-r") 'replace-regexp)
(global-set-key (kbd "C-M-r") 'my/batch-replace-strings)
(global-set-key (kbd "M-q") 'align-regexp)

(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)
(global-set-key (kbd "C-x x") 'exchange-point-and-mark)
;;(global-set-key "\C-x\C-b" 'buffer-menu) ;;overrides Buffer List ;;replaced by helm-mini

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

(provide 'my_keybinds)
;;; my_keybinds ends here
