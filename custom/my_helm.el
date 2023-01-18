;;; my_helm --- Summary
;;; Code:
;;; Commentary:

;;(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/helm/") ; facultative when installed with make install
(use-package helm
  :ensure t
  :bind (("M-x" . helm-M-x)
         ("C-x r b" . helm-filtered-bookmarks)
		 ("C-x C-f" . helm-find-files)
		 ("C-x C-d" . helm-browse-project)
		 ("C-x b" . helm-mini)
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
		)

  (helm-mode 1)
  )

;; (use-package helm-gtags
;;   :init
;;   (add-hook 'dired-mode-hook 'helm-gtags-mode)
;;   (add-hook 'eshell-mode-hook 'helm-gtags-mode)
;;   (add-hook 'c-mode-hook 'helm-gtags-mode)
;;   (add-hook 'c++-mode-hook 'helm-gtags-mode)
;;   (add-hook 'asm-mode-hook 'helm-gtags-mode)

;;   :config
;;   (define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
;;   (define-key helm-gtags-mode-map (kbd "C-j") 'helm-gtags-select)
;;   (define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
;;   (define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
;;   (define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
;;   (define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)
;;   )

(provide 'my_helm)
;;; my_helm ends here
