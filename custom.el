(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auth-source-save-behavior nil)
 '(package-selected-packages
   '(ag anaphora auctex benchmark-init company-auctex company-c-headers
		company-jedi dired-rainbow disk-usage emojify git gnuplot
		go-complete gptel grep-a-lot helm-bibtex helm-lsp helm-slime
		helm-swoop hide-mode-line highlight-indentation imenu-list
		impatient-mode irony jedi latex-math-preview lsp-ui
		multiple-cursors nlinum notmuch openwith org-contrib org-ref
		org-roam ov pdf-tools php-mode polymode python-mode pyvenv
		quelpa rainbow-delimiters realgud restart-emacs shackle
		slime-repl-ansi-color smooth-scrolling sudo-edit swiper-helm
		tex toc-org use-package vi-tilde-fringe vterm-toggle webpaste
		websocket which-key with-venv wttrin xterm-color yaml-mode
		yasnippet-classic-snippets yasnippet-snippets zenburn-theme
		zoom))
 '(safe-local-variable-values
   '((TeX-master . t) (etags-regen-ignores "test/manual/etags/")
	 (etags-regen-regexp-alist
	  (("c" "objc") "/[ \11]*DEFVAR_[A-Z_ \11(]+\"\\([^\"]+\\)\"/\\1/"
	   "/[ \11]*DEFVAR_[A-Z_ \11(]+\"[^\"]+\",[ \11]\\([A-Za-z0-9_]+\\)/\\1/")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-block ((t (:background "gray30" :foreground "#FFFFFD"))))
 '(org-block-begin-line ((t (:height 0.75 :weight bold :foreground "gray5" :background "orange4" :box (:style released-button) :extend t))))
 '(org-block-end-line ((t (:height 0.75 :weight bold :foreground "gray5" :background "orange4" :box (:style released-button) :extend t))))
 '(org-cite-face ((t (:weight bold :foreground "#DC8CC3"))))
 '(org-code ((t (:height 0.65 :foreground "#7F9F7F"))))
 '(org-document-info ((t (:background "#303030"))))
 '(org-document-info-keyword ((t (:background "#303030"))))
 '(org-document-title ((t (:foreground "#6C3333" :underline nil))))
 '(org-drawer ((t (:background "#303030" :foreground "#6CA0A3"))))
 '(org-ellipsis ((t (:inherit default :weight regular :foreground "#DCDCCC" :foreground "#989890"))))
 '(org-level-1 ((t (:inherit default :weight regular :foreground "#DCDCCC" :weight bold :foreground "#6C3333"))))
 '(org-level-2 ((t (:inherit default :weight regular :foreground "#DCDCCC" :weight bold :foreground "chartreuse4"))))
 '(org-level-3 ((t (:inherit default :weight regular :foreground "#DCDCCC" :weight bold :foreground "#6a5acd"))))
 '(org-level-4 ((t (:inherit default :weight regular :foreground "#DCDCCC" :foreground "#DEB887"))))
 '(org-level-5 ((t (:inherit default :weight regular :foreground "#DCDCCC" :foreground "#BA55D3"))))
 '(org-level-6 ((t (:inherit default :weight regular :foreground "#DCDCCC" :foreground "#5C4033"))))
 '(org-link ((t (:foreground "#93E0E3" :underline (:color foreground-color :style line)))))
 '(org-meta-line ((t (:foreground "#989890"))))
 '(org-property-value ((t (:background "#2B2B2B" :foreground "#FFFFEF"))))
 '(org-special-keyword ((t (:background "#303030" :foreground "#9FC59F"))))
 '(org-table ((t (:foreground "#9FC59F"))))
 '(org-tag ((t (:background "#303030" :foreground "#9FC59F"))))
 '(org-tag-group ((t (:background "#303030" :foreground "#9FC59F"))))
 '(org-verbatim ((t (:foreground "#DC8CC3"))))
 '(org-verse ((t (:foreground "#9FC59F")))))
