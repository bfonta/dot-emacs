(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-command-list
   '(("TeX" "%(PDF)%(tex) %(file-line-error) %`%(extraopts) %S%(PDFout)%(mode)%' %t" TeX-run-TeX nil
	  (plain-tex-mode texinfo-mode ams-tex-mode)
	  :help "Run plain TeX")
	 ("LaTeX" "%`%l%(mode)%' --shell-escape %T" TeX-run-TeX nil
	  (latex-mode doctex-mode)
	  :help "Run LaTeX")
	 ("Makeinfo" "makeinfo %(extraopts) %t" TeX-run-compile nil
	  (texinfo-mode)
	  :help "Run Makeinfo with Info output")
	 ("Makeinfo HTML" "makeinfo %(extraopts) --html %t" TeX-run-compile nil
	  (texinfo-mode)
	  :help "Run Makeinfo with HTML output")
	 ("AmSTeX" "amstex %(PDFout) %`%(extraopts) %S%(mode)%' %t" TeX-run-TeX nil
	  (ams-tex-mode)
	  :help "Run AMSTeX")
	 ("ConTeXt" "%(cntxcom) --once --texutil %(extraopts) %(execopts)%t" TeX-run-TeX nil
	  (context-mode)
	  :help "Run ConTeXt once")
	 ("ConTeXt Full" "%(cntxcom) %(extraopts) %(execopts)%t" TeX-run-TeX nil
	  (context-mode)
	  :help "Run ConTeXt until completion")
	 ("BibTeX" "bibtex %s" TeX-run-BibTeX nil
	  (plain-tex-mode latex-mode doctex-mode context-mode texinfo-mode ams-tex-mode)
	  :help "Run BibTeX")
	 ("Biber" "biber %s" TeX-run-Biber nil
	  (plain-tex-mode latex-mode doctex-mode texinfo-mode ams-tex-mode)
	  :help "Run Biber")
	 ("View" "%V" TeX-run-discard-or-function t t :help "Run Viewer")
	 ("Print" "%p" TeX-run-command t t :help "Print the file")
	 ("Queue" "%q" TeX-run-background nil t :help "View the printer queue" :visible TeX-queue-command)
	 ("File" "%(o?)dvips %d -o %f " TeX-run-dvips t
	  (plain-tex-mode latex-mode doctex-mode texinfo-mode ams-tex-mode)
	  :help "Generate PostScript file")
	 ("Dvips" "%(o?)dvips %d -o %f " TeX-run-dvips nil
	  (plain-tex-mode latex-mode doctex-mode texinfo-mode ams-tex-mode)
	  :help "Convert DVI file to PostScript")
	 ("Dvipdfmx" "dvipdfmx %d" TeX-run-dvipdfmx nil
	  (plain-tex-mode latex-mode doctex-mode texinfo-mode ams-tex-mode)
	  :help "Convert DVI file to PDF with dvipdfmx")
	 ("Ps2pdf" "ps2pdf %f" TeX-run-ps2pdf nil
	  (plain-tex-mode latex-mode doctex-mode texinfo-mode ams-tex-mode)
	  :help "Convert PostScript file to PDF")
	 ("Glossaries" "makeglossaries %s" TeX-run-command nil
	  (plain-tex-mode latex-mode doctex-mode texinfo-mode ams-tex-mode)
	  :help "Run makeglossaries to create glossary\12     file")
	 ("Index" "makeindex %s" TeX-run-index nil
	  (plain-tex-mode latex-mode doctex-mode texinfo-mode ams-tex-mode)
	  :help "Run makeindex to create index file")
	 ("upMendex" "upmendex %s" TeX-run-index t
	  (plain-tex-mode latex-mode doctex-mode texinfo-mode ams-tex-mode)
	  :help "Run upmendex to create index file")
	 ("Xindy" "texindy %s" TeX-run-command nil
	  (plain-tex-mode latex-mode doctex-mode texinfo-mode ams-tex-mode)
	  :help "Run xindy to create index file")
	 ("Check" "lacheck %s" TeX-run-compile nil
	  (latex-mode)
	  :help "Check LaTeX file for correctness")
	 ("ChkTeX" "chktex -v6 %s" TeX-run-compile nil
	  (latex-mode)
	  :help "Check LaTeX file for common mistakes")
	 ("Spell" "(TeX-ispell-document \"\")" TeX-run-function nil t :help "Spell-check the document")
	 ("Clean" "TeX-clean" TeX-run-function nil t :help "Delete generated intermediate files")
	 ("Clean All" "(TeX-clean t)" TeX-run-function nil t :help "Delete generated intermediate and output files")
	 ("Other" "" TeX-run-command t t :help "Run an arbitrary command")))
 '(TeX-engine 'xetex)
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(conda-anaconda-home "~/miniconda3")
 '(csv-align-padding 3)
 '(custom-enabled-themes '(zenburn))
 '(custom-safe-themes
   '("dea4b7d43d646aa06a4f705a58f874ec706f896c25993fcf73de406e27dc65ba" "3b8284e207ff93dfc5e5ada8b7b00a3305351a3fb222782d8033a400a48eca48" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default))
 '(dired-listing-switches "-a -l -h --group-directories-first")
 '(dired-subtree-line-prefix "   ")
 '(fringe-mode '(1 . 0) nil (fringe))
 '(grep-command "grep --nr '.' -e '' ")
 '(helm-completion-style 'emacs)
 '(hl-todo-keyword-faces
   '(("TODO" . "#dc752f")
	 ("NEXT" . "#dc752f")
	 ("THEM" . "#2d9574")
	 ("PROG" . "#4f97d7")
	 ("OKAY" . "#4f97d7")
	 ("DONT" . "#f2241f")
	 ("FAIL" . "#f2241f")
	 ("DONE" . "#86dc2f")
	 ("NOTE" . "#b1951d")
	 ("KLUDGE" . "#b1951d")
	 ("HACK" . "#b1951d")
	 ("TEMP" . "#b1951d")
	 ("FIXME" . "#dc752f")
	 ("XXX+" . "#dc752f")
	 ("\\?\\?\\?+" . "#dc752f")))
 '(inhibit-startup-screen t)
 '(line-number-mode nil)
 '(magit-bury-buffer-function 'magit-mode-quit-window)
 '(org-agenda-files
   '("/home/bruno/dot-emacs/bibliography/example.org" "/home/bruno/org/PhD/BayesianStatistics/classes/16June2022/16June2022.org" "/home/bruno/org/Indico.org"))
 '(org-fontify-done-headline nil)
 '(org-fontify-todo-headline nil)
 '(org-format-latex-options
   '(:foreground orange :background default :scale 1.5 :html-foreground "Black" :html-background "Transparent" :html-scale 1.5 :matchers
				 ("begin" "$1" "$" "$$" "\\(" "\\[")))
 '(package-selected-packages
   '(helm-bibtex toc-org ggtags openwith dired-collapse dired dired-rainbow with-venv pdf-tools php-mode vterm-toggle vterm orglink company vundo imenu-list flx git-timemachine restart-emacs company-jedi tex company-auctex tex-ispell cl latex nlinum shackle latex-math-preview epc git impatient-mode pdf-continuous-scroll-mode org-pdftools yasnippet-classic-snippets native-complete ssh org-download visual-fill-column org-superstar exwm xterm-color rainbow-delimiters spacemacs-theme hide-mode-line easy-after-load minions ghub mu4e-alert smtpmail-multi company-c-headers smooth-scrolling helm-pydoc pydoc anaconda-mode magithub eimp image+ go-mode neotree smartparens latex-preview-pane yaml-mode latex-unicode-math-mode yasnippet))
 '(pdf-view-midnight-colors '("#b2b2b2" . "#292b2e"))
 '(persp-keymap-prefix [M-up])
 '(persp-mode t)
 '(preview-gs-options
   '("-q" "-dNOPAUSE" "-DNOPLATFONTS" "-dPrinted" "-dTextAlphaBits=4" "-dGraphicsAlphaBits=4" "-dDELAYSAFER"))
 '(safe-local-variable-values '((TeX-master . t)))
 '(send-mail-function 'smtpmail-send-it)
 '(size-indication-mode t)
 '(smerge-command-prefix "\3v")
 '(swiper-faces
   '(swiper-match-face-1 swiper-match-face-2 swiper-match-face-3 swiper-match-face-4))
 '(vc-handled-backends '(Git))
 '(warning-suppress-types '((magit) (comp)))
 '(which-function-mode t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#242424" :foreground "#f6f3e8" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "DAMA" :family "Ubuntu Mono"))))
 '(company-tooltip ((t (:background "cornsilk" :foreground "black"))))
 '(company-tooltip-annotation ((t (:background "black" :foreground "#DFAF8F"))))
 '(company-tooltip-annotation-selection ((t (:background "black" :foreground "#DFAF8F"))))
 '(company-tooltip-common ((t (:foreground "tomato"))))
 '(company-tooltip-common-selection ((t (:foreground "firebrick"))))
 '(company-tooltip-scrollbar-track ((t (:background "black"))))
 '(company-tooltip-selection ((t (:background "sandy brown" :foreground "black"))))
 '(cursor ((t (:background "gainsboro" :foreground "black" :weight heavy))))
 '(highlight ((t (:background "light gray"))))
 '(org-block ((t (:font "Monospace" :height 1.0 :background "gray30" :foreground "#FFFFFD"))))
 '(org-block-begin-line ((t (:family "Sans Serif" :width ultracondensed :height 0.6 :weight semibold :foreground "gray16" :background "orange4" :box (:style released-button) :extend t))))
 '(org-block-end-line ((t (:family "Sans Serif" :width ultracondensed :height 0.6 :weight semibold :foreground "gray16" :background "orange4" :box (:style released-button) :extend t))))
 '(org-checkbox ((t (:family "Sans Serif" :foreground "#FFFFFD"))))
 '(org-code ((t (:font "Monospace" :height 1.0 :foreground "#D0BF8F"))))
 '(org-document-info ((t (:family "Sans Serif" :background "#303030"))))
 '(org-document-info-keyword ((t (:family "Sans Serif" :background "#303030"))))
 '(org-document-title ((t (:family "Sans Serif" :foreground "#6C3333" :underline nil))))
 '(org-drawer ((t (:family "Sans Serif" :background "#303030" :foreground "#6CA0A3"))))
 '(org-ellipsis ((t (:inherit default :weight regular :foreground "#f6f3e8" :family "Sans Serif" :foreground "#989890"))))
 '(org-level-1 ((t (:inherit default :weight regular :foreground "#f6f3e8" :family "Sans Serif" :foreground "#6C3333"))))
 '(org-level-2 ((t (:inherit default :weight regular :foreground "#f6f3e8" :family "Sans Serif" :foreground "#7F9F7F"))))
 '(org-level-3 ((t (:inherit default :weight regular :foreground "#f6f3e8" :family "Sans Serif" :foreground "#6a5acd"))))
 '(org-level-4 ((t (:inherit default :weight regular :foreground "#f6f3e8" :family "Sans Serif" :foreground "#DEB887"))))
 '(org-level-5 ((t (:inherit default :weight regular :foreground "#f6f3e8" :family "Sans Serif" :foreground "#BA55D3"))))
 '(org-level-6 ((t (:inherit default :weight regular :foreground "#f6f3e8" :family "Sans Serif" :foreground "#5C4033"))))
 '(org-link ((t (:family "Sans Serif" :foreground "#93E0E3" :underline (:color foreground-color :style line)))))
 '(org-meta-line ((t (:foreground "light gray" :height 0.5 :family "Sans Serif"))))
 '(org-property-value ((t (:family "Sans Serif" :background "#2B2B2B" :foreground "#FFFFEF"))) t)
 '(org-special-keyword ((t (:family "Sans Serif" :background "#303030" :foreground "#9FC59F"))))
 '(org-table ((t (:family "Sans Serif" :foreground "#9FC59F"))))
 '(org-tag ((t (:family "Sans Serif" :background "#303030" :foreground "#9FC59F"))))
 '(org-tag-group ((t (:family "Sans Serif" :background "#303030" :foreground "#9FC59F"))))
 '(org-verbatim ((t (:family "Sans Serif" :foreground "#DC8CC3"))))
 '(org-verse ((t (:family "Sans Serif" :foreground "#9FC59F"))))
 '(region ((t (:extend t :background "gray" :foreground "black")))))
