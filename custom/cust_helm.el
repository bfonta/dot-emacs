;;; cust_helm --- Summary
;;; Code:
;;; Commentary:

;;(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/helm/") ; facultative when installed with make install
(use-package helm
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

;;;;;;;;;;;;;;;;;;;
;; helm swoop ;;
;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/dot-emacs/swoop/")
(load-library "helm-swoop")
(use-package helm-swoop
  :defer t
  :init (require 'helm)
  :bind (("M-s" . helm-swoop)
		 ("M-S" . helm-swoop-back-to-last-point)
		 ("C-c M-s" . helm-multi-swoop)
		 ;; "M-s-a-w") helm-multi-swoop-all)		  
		 )
  :config
  ;; When doing isearch, hand the word over to helm-swoop
  (define-key isearch-mode-map (kbd "M-s") 'helm-swoop-from-isearch)
  ;; From helm-swoop to helm-multi-swoop-all
  (define-key helm-swoop-map (kbd "M-s") 'helm-multi-swoop-all-from-helm-swoop)
  ;; When doing evil-search, hand the word over to helm-swoop
  ;; (define-key evil-motion-state-map (kbd "M-i") 'helm-swoop-from-evil-search)

  ;; Instead of helm-multi-swoop-all, you can also use helm-multi-swoop-current-mode
  (define-key helm-swoop-map (kbd "M-m") 'helm-multi-swoop-current-mode-from-helm-swoop)

  ;; Move up and down like isearch
  (define-key helm-swoop-map (kbd "C-r") 'helm-previous-line)
  (define-key helm-swoop-map (kbd "C-s") 'helm-next-line)
  (define-key helm-multi-swoop-map (kbd "C-r") 'helm-previous-line)
  (define-key helm-multi-swoop-map (kbd "C-s") 'helm-next-line)
  
  (setq helm-multi-swoop-edit-save t ;; Save buffer when helm-multi-swoop-edit complete
		;; If this value is t, split window inside the current window
		helm-swoop-split-with-multiple-windows nil
		;; Split direction. 'split-window-vertically or 'split-window-horizontally
		helm-swoop-split-direction 'split-window-vertically
		;; If nil, you can slightly boost invoke speed in exchange for text color
		helm-swoop-speed-or-color nil
		;; ;; Go to the opposite side of line from the end or beginning of line
		helm-swoop-move-to-line-cycle t
		;; Optional face for line numbers
		;; Face name is `helm-swoop-line-number-face`
		helm-swoop-use-line-number-face t
		;; If you prefer fuzzy matching
		helm-swoop-use-fuzzy-match t
		)
  )

(provide 'cust_helm)
;;; cust_helm ends here
