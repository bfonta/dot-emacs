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
 '(cua-mode t nil (cua-base))
 '(custom-enabled-themes '(zenburn))
 '(custom-safe-themes
   '("dea4b7d43d646aa06a4f705a58f874ec706f896c25993fcf73de406e27dc65ba" "3b8284e207ff93dfc5e5ada8b7b00a3305351a3fb222782d8033a400a48eca48" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default))
 '(dired-listing-switches "-a -l -h --group-directories-first")
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
   '("~/org/PhD/BayesianStatistics/classes/16June2022/16June2022.org" "/home/bruno/org/Indico.org"))
 '(org-fontify-done-headline nil)
 '(org-fontify-todo-headline nil)
 '(org-format-latex-options
   '(:foreground orange :background default :scale 1.5 :html-foreground "Black" :html-background "Transparent" :html-scale 1.5 :matchers
				 ("begin" "$1" "$" "$$" "\\(" "\\[")))
 '(package-selected-packages
   '(php-mode vterm-toggle vterm orglink company vundo imenu-list flx git-timemachine restart-emacs company-jedi tex company-auctex tex-ispell cl latex emojify nlinum shackle latex-math-preview epc git impatient-mode pdf-continuous-scroll-mode org-pdftools yasnippet-classic-snippets native-complete ssh org-download visual-fill-column org-superstar exwm xterm-color rainbow-delimiters spacemacs-theme hide-mode-line easy-after-load minions ghub mu4e-alert smtpmail-multi company-c-headers smooth-scrolling helm-pydoc pydoc anaconda-mode magithub eimp image+ go-mode neotree smartparens latex-preview-pane yaml-mode latex-unicode-math-mode yasnippet))
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
 '(company-tooltip-scrollbar-thumb ((t (:background "tomato"))))
 '(company-tooltip-scrollbar-track ((t (:background "black"))))
 '(company-tooltip-selection ((t (:background "sandy brown" :foreground "black"))))
 '(cua-rectangle ((t (:inherit region))))
 '(fixed-pitch ((t (:family "Fira Code Retina"))))
 '(font-latex-math-face ((t (:foreground "dark violet"))))
 '(font-latex-slide-title-face ((t (:foreground "tomato" :weight bold :height 1.2 :width normal))))
 '(font-latex-verbatim-face ((t (:inherit fixed-pitch :foreground "dark gray" :height 0.45))))
 '(font-lock-function-name-face ((t (:foreground "#93E0E3"))))
 '(hl-line ((t (:extend t :background "saddle brown" :box (:line-width (1 . 1) :color "light gray" :style flat-button)))))
 '(isearch ((t (:background "gray15" :foreground "#D0BF8F" :weight bold))))
 '(org-block ((t (:inherit fixed-pitch :extend t :background "gray30" :height 0.5))))
 '(org-block-begin-line ((t (:inherit fixed-pitch :foreground "orange red" :height 0.4))))
 '(org-block-end-line ((t (:inherit fixed-pitch :foreground "orange red" :height 0.4))))
 '(org-checkbox ((t (:height 1.0 :foreground "#FFFFFD"))))
 '(org-code ((t (:inherit (shadow fixed-pitch) :foreground "dark goldenrod" :height 0.6))))
 '(org-default ((t (:inherit default))))
 '(org-document-info ((t (:foreground "dark orange"))))
 '(org-document-info-keyword ((t (:inherit fixed-pitch :height 0.4))))
 '(org-document-title ((t (:inherit default :foreground "#f6f3e8" :underline nil :slant normal :weight bold :height 1 :width normal :foundry "ADBO" :family "Source Sans Pro"))))
 '(org-drawer ((t (:inherit fixed-pitch :foreground "LightSkyBlue" :height 0.5))))
 '(org-ellipsis ((t (:height 1.0 :foreground "#989890"))))
 '(org-indent ((t (:inherit (org-hide fixed-pitch)))))
 '(org-latex-and-related ((t (:foreground "burlywood"))))
 '(org-level-1 ((t (:inherit default :weight bold :foreground "black" :family "Sans Serif" :height 1.75))))
 '(org-level-2 ((t (:inherit default :weight bold :foreground "black" :family "Sans Serif" :height 1.5))))
 '(org-level-3 ((t (:inherit default :weight bold :foreground "black" :family "Sans Serif" :height 1.25))))
 '(org-level-4 ((t (:inherit default :weight bold :foreground "black" :family "Sans Serif" :height 1.1))))
 '(org-level-5 ((t (:inherit default :weight bold :foreground "black" :family "Sans Serif"))))
 '(org-level-6 ((t (:inherit default :weight bold :foreground "black" :family "Sans Serif"))))
 '(org-level-7 ((t (:inherit default :weight bold :foreground "black" :family "Sans Serif"))))
 '(org-level-8 ((t (:inherit default :weight bold :foreground "black" :family "Sans Serif"))))
 '(org-link ((t (:inherit default :foreground "steel blue" :underline t :weight bold :height 50 :family "Sans Serif"))))
 '(org-meta-line ((t (:inherit fixed-pitch :height 0.4))))
 '(org-property-value ((t (:inherit fixed-pitch :height 0.5))) t)
 '(org-special-keyword ((t (:inherit fixed-pitch :height 0.5))))
 '(org-table ((t (:inherit fixed-pitch :foreground "#83a598" :height 0.45))))
 '(org-tag ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.4))))
 '(org-tag-group ((t (:height 1.0 :background "#303030" :foreground "#9FC59F"))))
 '(org-verbatim ((t (:inherit default :foreground "dark violet" :weight bold :family "Sans Serif"))))
 '(org-verse ((t (:inherit org-block :height 0.8))))
 '(read-multiple-choice-face ((t (:inherit (help-key-binding underline) :weight medium :height 1.0))))
 '(region ((t (:extend t :background "sienna"))))
 '(swiper-line-face ((t (:extend t :background "peru" :foreground "black" :box (:line-width (3 . 3) :color "black" :style pressed-button) :overline nil :underline nil))))
 '(swiper-match-face-1 ((t (:inherit lazy-highlight :background "chocolate" :foreground "black"))))
 '(tex-verbatim ((t (:inherit default))))
 '(variable-pitch ((t (:weight thin :height 80 :family "ETBook"))))
 '(vc-state-base ((t (:foreground "orange red"))))
 '(which-func ((t (:background "gray26" :foreground "goldenrod")))))

