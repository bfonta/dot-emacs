(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(gptel disk-usage wttrin org-roam zoom zenburn-theme yasnippet-snippets yasnippet-classic-snippets yaml-mode xterm-color with-venv which-key websocket webpaste vterm-toggle vi-tilde-fringe use-package toc-org swiper-helm smooth-scrolling slime-repl-ansi-color shackle restart-emacs realgud rainbow-delimiters quelpa pyvenv python-mode polymode php-mode pdf-tools ov org-ref openwith notmuch nlinum multiple-cursors lsp-ui latex-math-preview jedi irony impatient-mode imenu-list highlight-indentation hide-mode-line helm-swoop helm-slime helm-lsp helm-bibtex grep-a-lot go-complete gnuplot git emojify dired-rainbow company-jedi company-c-headers company-auctex benchmark-init anaphora ag))
 '(safe-local-variable-values
   '((etags-regen-ignores "test/manual/etags/")
	 (etags-regen-regexp-alist
	  (("c" "objc")
	   "/[ \11]*DEFVAR_[A-Z_ \11(]+\"\\([^\"]+\\)\"/\\1/" "/[ \11]*DEFVAR_[A-Z_ \11(]+\"[^\"]+\",[ \11]\\([A-Za-z0-9_]+\\)/\\1/")))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(hl-line ((t (:inherit nil :extend t :box (:line-width (1 . 4) :color "saddle brown" :style flat-button)))))
 '(org-block ((t (:font "Monospace" :height 1.0 :background "gray30" :foreground "#FFFFFD"))))
 '(org-block-begin-line ((t (:family "Sans Serif" :width ultracondensed :height 0.6 :weight semibold :foreground "gray16" :background "orange4" :box (:style released-button) :extend t))))
 '(org-block-end-line ((t (:family "Sans Serif" :width ultracondensed :height 0.6 :weight semibold :foreground "gray16" :background "orange4" :box (:style released-button) :extend t))))
 '(org-checkbox ((t (:foreground "#FFFFFD"))))
 '(org-code ((t (:font "Monospace" :height 1.0 :foreground "#D0BF8F"))))
 '(org-document-info ((t (:background "#303030"))))
 '(org-document-info-keyword ((t (:background "#303030"))))
 '(org-document-title ((t (:foreground "#6C3333" :underline nil))))
 '(org-drawer ((t (:background "#303030" :foreground "#6CA0A3"))))
 '(org-ellipsis ((t (:inherit default :weight regular :foreground "#DCDCCC" :foreground "#989890"))))
 '(org-level-1 ((t (:inherit default :weight regular :foreground "#DCDCCC" :foreground "#6C3333"))))
 '(org-level-2 ((t (:inherit default :weight regular :foreground "#DCDCCC" :foreground "#7F9F7F"))))
 '(org-level-3 ((t (:inherit default :weight regular :foreground "#DCDCCC" :foreground "#6a5acd"))))
 '(org-level-4 ((t (:inherit default :weight regular :foreground "#DCDCCC" :foreground "#DEB887"))))
 '(org-level-5 ((t (:inherit default :weight regular :foreground "#DCDCCC" :foreground "#BA55D3"))))
 '(org-level-6 ((t (:inherit default :weight regular :foreground "#DCDCCC" :foreground "#5C4033"))))
 '(org-link ((t (:foreground "#93E0E3" :underline (:color foreground-color :style line)))))
 '(org-meta-line ((t (:foreground "#989890"))))
 '(org-property-value ((t (:background "#2B2B2B" :foreground "#FFFFEF"))) t)
 '(org-special-keyword ((t (:background "#303030" :foreground "#9FC59F"))))
 '(org-table ((t (:foreground "#9FC59F"))))
 '(org-tag ((t (:background "#303030" :foreground "#9FC59F"))))
 '(org-tag-group ((t (:background "#303030" :foreground "#9FC59F"))))
 '(org-verbatim ((t (:foreground "#DC8CC3"))))
 '(org-verse ((t (:foreground "#9FC59F")))))
