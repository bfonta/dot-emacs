;;; -*- lexical-binding: nil; -*-

;;; my_helm --- Summary
;;; Code:
;;; Commentary: 

;;; for cscope to work, the following must be run before on the root directory of the project
;;;    find `pwd` \( \( -iname "*.c" -o -iname "*.cc" -o -iname "*.h" \) -and \( -not -type l \) \) -print > cscope.files
;;;    cscope -b -q -R -i cscope.files # create databse
(use-package helm
  :ensure t
  :bind (("M-x" . helm-M-x)
         ("C-x r b" . helm-filtered-bookmarks)
		 ("C-x C-f" . helm-find-files)
		 ("C-x C-d" . helm-browse-project)
		 ("C-x b" . helm-mini)
		 ("C-x k" . helm-show-kill-ring)
		 ("C-D" . 'helm-buffer-run-kill-buffers)
		 ;; "<tab>" . helm-execute-persistent-action) ; rebind tab to run persistent action
		 )
  :config
  (setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
		helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
		helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
		helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
		helm-ff-file-name-history-use-recentf t
		helm-display-header-line nil
		helm-M-x-fuzzy-match t ;; optional fuzzy matching for helm-M-x)
		helm-autoresize-max-height 15
		helm-autoresize-min-height 10
		helm-buffer-max-length 40
		helm-autoresize-mode 1
		helm-ff-skip-boring-files t ;; skips files listed in helm-boring-file-regexp-list when using helm-find-files, like *~
		helm-boring-buffer-regexp-list (list (rx ".*~$") (rx ".*#$"))
		helm-mode-handle-completion-in-region nil ;; does not replace completion-at-point #https://github.com/emacs-helm/helm/issues/2257
		helm-follow-mode t ;; visits ("follows" files as the result search buffer is scrolled through)
		helm-follow-mode-persistent t ;; save the follow mode state between sessions
		)

  (define-key helm-map (kbd "C-<left>") 'backward-char)
  (define-key helm-map (kbd "C-<right>") 'forward-char)
  ;; (helm-mode 1)
  )

(use-package xcscope
  :ensure t)

;; Same bug observed as in https://github.com/alpha22jp/helm-cscope.el/issues/8
;; fixed by invoking before a cscope function and interact with the cscope buffer one, typing for instance 'n' for 'next'
;; or by entering a buffer with the C language mode
(use-package helm-cscope
  :ensure t
  :after helm xcscope
  :init (helm-cscope-mode 1)
  :config
  (add-hook 'c-mode-common-hook 'helm-cscope-mode)

  ;; remap (some) cscope keybinds to helm-cscope
  (eval-after-load "xcscope"
  '(progn (define-key cscope-minor-mode-keymap (kbd "C-c s d") 'helm-cscope-find-global-definition)
          (define-key cscope-minor-mode-keymap (kbd "C-c s f") 'helm-cscope-find-calling-this-function)
		  (define-key cscope-minor-mode-keymap (kbd "C-c s s") 'helm-cscope-find-this-symbol)
		  (define-key cscope-minor-mode-keymap (kbd "C-c s m") 'helm-cscope-pop-mark)
		  (define-key cscope-minor-mode-keymap (kbd "C-c s i") 'helm-cscope-find-files-including-file))))

(provide 'my_helm)
;;; my_helm ends here
