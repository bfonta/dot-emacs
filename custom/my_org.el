;;; my_org --- Summary
;;; Code:
;;; Commentary: https://emacs.christianbaeuerlein.com/my-org-config.html#orgc3bc9b5 and https://hugocisneros.com/org-config/#faces-setup

(use-package org
  :mode ("\\.org$" . org-mode)
  :config
  ;(global-set-key "\C-cl" 'org-store-link)
  ;(global-set-key "\C-ca" 'org-agenda)
  (global-set-key (kbd "\C-cv") 'org-latex-export-to-pdf)
  (global-set-key (kbd "\C-cb") 'org-beamer-export-to-pdf)

  ;; Org-mode: support shift selection also when cua mode is on
  (setq org-support-shift-select t)
  (eval-after-load "org"
    '(progn
       (eval-after-load "cua-base"
         '(progn            
            (defadvice org-call-for-shift-select (before org-call-for-shift-select-cua activate)
              (if (and cua-mode
                       org-support-shift-select
                       (not (use-region-p)))
                  (cua-set-mark)))))))

  ;; Make windmove work in Org mode:
  (add-hook 'org-shiftup-final-hook 'windmove-up)
  (add-hook 'org-shiftleft-final-hook 'windmove-left)
  (add-hook 'org-shiftdown-final-hook 'windmove-down)
  (add-hook 'org-shiftright-final-hook 'windmove-right)

  ;; imenu-like interface
  (setq org-goto-interface 'outline-path-completionp)
  (setq org-outline-path-complete-in-steps nil)

  ;; always inline images
  (setq org-startup-with-inline-images t)

  (setq org-log-into-drawer t)

  ;; hide blocks by default
  (setq org-startup-folded t)

  ;; TODO keywords
  (setq org-todo-keywords
		(quote ((sequence "TODO(t)" "NEXT(n)" "IN PROGRESS(p)" "|" "DONE(d)" "WAITING" "CANCELLED")
				)))
  ;; This is so I cannot set a headline to DONE if children aren’t DONE.
  (setq-default org-enforce-todo-dependencies t)
  ;; This sets the colors of keywords. Not that important because I also hide them with org-superstar. The keywords are still shown when placing the cursor on them.
  (setq org-todo-keyword-faces
		(quote (("TODO" :foreground "#CC9393" :weight bold)
				("NEXT" :foreground "#DC8CC3" :weight bold)
				("DONE" :foreground "#9FC59F" :weight bold)
				("WAITING" :foreground "#DFAF8F" :weight bold)
				("CANCELLED" :foreground "#ECB3B3" :weight bold)
				)))
  ;; I don't wan't the keywords in my exports
  (setq-default org-export-with-todo-keywords nil)


  ;; define tags
  (setq org-tag-alist '((:startgroup . nil)
						("@CERN" . ?c) ("@LLR" . ?l)
						("@Personal" . ?t)
						(:endgroup . nil)
						("other" . ?o)))

  ;; define priorities
  (setq org-enable-priority-commands t
		org-highest-priority ?1
		org-default-priority ?5
		org-lowest-priority ?5
		)

  ;; Changes to task states might get logged, especially for recurring routines. If so, log them in a drawer, not the content of the note. 
  (setq org-log-state-notes-into-drawer t)

  ;; While Org mode needs a lot of custom styling to work in variable-pitch-mode I take the easy way out in the agenda view by choosing the monospaced version of the font: iA Writer Mono S. It is way easier to align the ASCII tables of agenda with a font with a fixed pitch.
  (defun my-org-config/setup-buffer-face ()
	(setq buffer-face-mode-face '(:family "iA Writer Mono S"))
	(buffer-face-mode)
	)
  (add-hook 'org-agenda-mode-hook 'my-org-config/setup-buffer-face)

  ;;Once Org mode loaded, turn on olivetti, hide tilde fringes and enable visual line mode.
  (defun my-org-config/after-org-mode-load ()
	(visual-line-mode)
	(vi-tilde-fringe-mode -1)
	)

  (add-hook 'org-mode-hook 'my-org-config/after-org-mode-load)

  ;; I use a general inbox file to collect all new tasks on the run and will batch-schedule/refile them a couple times a day.
  ;; Inbox and mobile inbox co-exist to prevent sync conflicts when adding tasks while having no internet connection. This works pretty well and I treat them equally in the agenda views. 
  (defvar org-my-inbox-file "~/org/inbox.org")
  (defvar org-my-mobile-inbox-file "~/org/inbox_mobile.org")

  ;; Default note file, that will also be used for capturing new notes. 
  (setq org-default-notes-file org-my-inbox-file)

  ;; Work-related tasks and notes. 
  (defvar org-my-general-files "~/org")

  ;; Private tasks and notes. 
  (defvar org-my-projects-dir "~/org/projects")

  ;; The files to be used for agenda display. This contains:  Task inbox file, Mobile task inbox file, Work tasks file
  ;; (add-to-list 'org-agenda-files org-my-general-files)
  ;; (add-to-list 'org-agenda-files org-my-projects-dir)

  ;; Refile targets are all agenda files, plus my project files. I fine-tune the considered headings to prevent human error when choosing the new location.
  ;; (setq org-refile-targets (quote (
  ;;                                 (org-agenda-files :maxlevel . 2)
  ;;                                 )))

  ;; Store new notes at the beginning of a file or entry. 
  (setq org-reverse-note-order t)

  ;; These are my custom capture templates. 
  (setq org-capture-templates '(("t" "Todo [inbox]"
                                 entry
                                 (file "~/org/inbox.org")
                                 "* TODO %?\n:PROPERTIES:\n:CREATED: %U\n:END:\n  %i\n")
								("n" "Notable change/fact"
                                 entry
                                 (file "~/org/changelog.org")
                                 "* %? \n:PROPERTIES:\n:CREATED: %U\n:END:\n  %i\n")
								("l" "Link currently stored [inbox]"
                                 entry
                                 (file "~/org/inbox.org")
                                 "* TODO %i%?\n:PROPERTIES:\n:CREATED: %U\n:END:\n\%A\n%i\n")
								("f" "Feedback note"
                                 entry
                                 (file "~/org/feedback.org")
                                 "* Feedback for: %^{prompt}\n:PROPERTIES:\n:CREATED: %U\n:END:\n- [ ] %?\n\n")))


  ;;Store new notes at the beginning of a file or entry. 
  (setq org-reverse-note-order t)

  ;; Appearance
  ;; Show the filename and outline path in helm when refiling an entry. Also refile in one step (makes much more sense for helm).
  (setq org-refile-use-outline-path 'file)
  (setq org-outline-path-complete-in-steps nil)

  ;; Folding symbol for the headings.
  (setq org-ellipsis "...")

  ;; Show actually italicized text instead of /italicized text/. 
  (setq org-hide-emphasis-markers t)

  ;; Fontify (aka "highlight, change appearance via font settings") the whole line for headings. This is useful when setting a background color for the org-level-* faces.
  (setq org-fontify-whole-heading-line t)

  ;; Change the face of a headline if it is marked DONE. Normally, only the TODO/DONE keyword indicates the state of a headline. When this is non-nil, the headline after the keyword is set to the org-headline-done as an additional indication. 
  (setq org-fontify-done-headline t)

  ;; Add a special face to #+begin_quote and #+begin_verse block.
  (setq org-fontify-quote-and-verse-blocks t)

  ;; Show tags directly after headings (not on the right), which plays nicer with line-wrapping.
  (setq org-tags-column 0)

  ;; Beautify
  (defun my/style-org ()
	;; I have removed indentation to make the file look cleaner
	(org-indent-mode -1)
	
	;;(my/buffer-face-mode-variable)
	(setq line-spacing 0.1
          org-pretty-entities t
		  )

	;; inspired on zenburn theme
	(custom-theme-set-faces 'user
							`(org-level-1 ((t (:height 1.10 :foreground "#6C3333"))))
							`(org-level-2 ((t (:height 1.05 :foreground "#7F9F7F"))))
							`(org-level-3 ((t (:height 1.00 :foreground "#8CD0D3"))))
							`(org-level-4 ((t (:height 1.00 :foreground "#DEB887"))))
							;; `(org-level-5 ((t (:height 1.00 :foreground "#DEB887"))))
							;; `(org-level-6 ((t (:height 1.00 :foreground "#DEB887"))))
							;; `(org-level-7 ((t (:height 1.00 :foreground "#DEB887"))))
							;; `(org-level-8 ((t (:height 1.00 :foreground "#DEB887"))))

							`(org-ellipsis ((t (:height 1.00 :foreground "#989890"))))
							`(org-meta-line ((t (:height 1.00 :foreground "#989890"))))
							`(org-drawer ((t (:height 1.00 :background "#303030" :foreground "#6CA0A3"))))
							`(org-verbatim ((t (:height 1.0 :foreground "#DC8CC3"))))
							`(org-property-value ((t (:height 1.0 :background "#2B2B2B" :foreground "#FFFFEF"))))
							`(org-checkbox ((t (:height 1.0 :foreground "#FFFFFD"))))
							`(org-block ((t (:height 1.0 :background "#303030" :foreground "#FFFFFD"))))
							`(org-document-info ((t (:height 1.0 :background "#303030"))))
							`(org-document-info-keyword ((t (:height 1.0 :background "#303030"))))
							`(org-tag ((t (:height 1.0 :background "#303030" :foreground "#9FC59F"))))
							`(org-special-keyword ((t (:height 1.0 :background "#303030" :foreground "#9FC59F"))))
							`(org-tag-group ((t (:height 1.0 :background "#303030" :foreground "#9FC59F"))))
							`(org-verse ((t (:height 1.0 :foreground "#9FC59F"))))
							`(org-block-begin-line ((t (:height 1.0 :background "#303030" :foreground "#7C4343"))))
							`(org-block-end-line ((t (:height 1.0 :background "#303030" :foreground "#7C4343"))))
							`(org-code     ((t (:height 1.0 :foreground "#D0BF8F"))))
							`(org-link     ((t (:height 1.0 :foreground "#93E0E3" :underline (:color foreground-color :style line) ))))
							`(org-table    ((t (:height 1.0 :foreground "#9FC59F"))))
							`(org-document-title ((t (:height 1.15 :foreground "#6C3333" :underline nil))))
							)
	)
  (add-hook 'org-mode-hook 'my/style-org)

  ;; Babel
  ;; Syntax highlightning in code blocks
  (setq org-src-fontify-natively t)

  ;; Trying to fix indentation behaviour within code blocks. 
  (setq org-edit-src-content-indentation 0)
  (setq org-src-tab-acts-natively t)
  ;; (setq org-src-preserve-indentation t)

  ;; Allow babel code execution without confirming it every time. 
  (setq org-confirm-babel-evaluate nil)

  ;; Available embedded languages for babel.
  (org-babel-do-load-languages 'org-babel-load-languages
                               '((sql . t)
                                 (shell . t)
                                 (dot . t)
                                 (emacs-lisp . t)
                                 (ruby . t)
                                 (js . t)
                                 (plantuml . t)))

  ;; Export
  ;; Do not inline CSS code when generating HTML exports. Instead, the CSS of the chosen theme will be used. This especially applies to fontified code blocks. 
  (setq org-html-htmlize-output-type 'css)

  ;; Attachments
  ;; Org download should use the attachment features to save the images. 
  (setq org-download-method 'attach)

  ;; Org Roam
  (setq org-roam-directory (file-truename "~/org/org-roam"))
  ;; (("C-c n l" . org-roam-buffer-toggle)
  ;;  ("C-c n f" . org-roam-node-find)
  ;;  ("C-c n g" . org-roam-graph)
  ;;  ("C-c n i" . org-roam-node-insert)
  ;;  ("C-c n c" . org-roam-capture)
  ;;  ;; Dailies
  ;;  ("C-c n j" . org-roam-dailies-capture-today))

  ;; If you're using a vertical completion framework, you might want a more informative completion interface
  (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag)))
  ;; Setup Org-roam to run functions on file changes to maintain cache consistency. This is achieved by running M-x org-roam-db-autosync-mode. To ensure that Org-roam is available on startup, place this in your Emacs configuration: 
  (org-roam-db-autosync-mode)
  ;; Run once only (M-:) in case org-roam ids are not found:
  (org-id-update-id-locations (directory-files-recursively org-roam-directory ".org$\\|.org.gpg$"))

  ;; configure what sections are displayed in the buffer,
  (setq org-roam-mode-section-functions
		(list #'org-roam-backlinks-section
              #'org-roam-reflinks-section
              ;; #'org-roam-unlinked-references-section
              ))

  ;; Org-roam does not control how the pop-up buffer is displayed: this is left to the user.
  (add-to-list 'display-buffer-alist
               '("\\*org-roam\\*"
				 (display-buffer-in-direction)
				 (direction . right)
				 (window-width . 0.33)
				 (window-height . fit-window-to-buffer)))

  ;; Use org mode for eml files (useful for Thunderbird's ExternalEditor plugin)
  ;; (add-to-list 'auto-mode-alist
  ;;              '("\\.eml\\'" .
  ;; 				 (lambda ()
  ;;                  (org-mode)
  ;;                  ;; Disable auto-fill-mode.
  ;;                  (auto-fill-mode 0)
  ;;                  ;; If lines are longer than the screen width, show
  ;;                  ;; the broken arrow in the right margin.
  ;;                  (setq truncate-lines nil)
  ;;                  )))
  
  ;; enlarge and shrink windows while in an org-mode buffer
  (define-key org-mode-map (kbd "S-C-<left>") 'shrink-window-horizontally)
  (define-key org-mode-map (kbd "S-C-<right>") 'enlarge-window-horizontally)
  (define-key org-mode-map (kbd "S-C-<down>") 'shrink-window)
  (define-key org-mode-map (kbd "S-C-<up>") 'enlarge-window)

  ;; active Babel languages
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((gnuplot . t)))
  ;; add additional languages with '((language . t)))

  ;; Source: https://so.nwalsh.com/2020/01/05-latex
  (setq org-latex-compiler "xelatex")
  (setq org-latex-pdf-process
		(list (concat "latexmk -"
                      org-latex-compiler 
                      " -recorder -synctex=1 -bibtex-cond %b")))
  (setq org-latex-listings t)
  (setq org-latex-default-packages-alist
      '(("" "graphicx" t)
        ("" "grffile" t)
        ("" "longtable" nil)
        ("" "wrapfig" nil)
        ("" "rotating" nil)
        ("normalem" "ulem" t)
        ("" "amsmath" t)
        ("" "textcomp" t)
        ("" "amssymb" t)
        ("" "capt-of" nil)
        ("" "hyperref" nil)))
  (setq org-latex-classes
'(("article"
"\\RequirePackage{fix-cm}
\\PassOptionsToPackage{svgnames}{xcolor}
\\documentclass[11pt]{article}
\\usepackage{fontspec}
\\usepackage{sectsty}
\\allsectionsfont{\\sffamily}
\\usepackage{enumitem}
\\setlist[description]{style=unboxed,font=\\sffamily\\bfseries}
\\usepackage{listings}
\\lstset{frame=single,aboveskip=1em,
	framesep=.5em,backgroundcolor=\\color{AliceBlue},
	rulecolor=\\color{LightSteelBlue},framerule=1pt}
\\usepackage{xcolor}
\\newcommand\\basicdefault[1]{\\scriptsize\\color{Black}\\ttfamily#1}
\\lstset{basicstyle=\\basicdefault{\\spaceskip1em}}
\\lstset{literate=
	    {§}{{\\S}}1
	    {©}{{\\raisebox{.125ex}{\\copyright}\\enspace}}1
	    {«}{{\\guillemotleft}}1
	    {»}{{\\guillemotright}}1
	    {Á}{{\\'A}}1
	    {Ä}{{\\\"A}}1
	    {É}{{\\'E}}1
	    {Í}{{\\'I}}1
	    {Ó}{{\\'O}}1
	    {Ö}{{\\\"O}}1
	    {Ú}{{\\'U}}1
	    {Ü}{{\\\"U}}1
	    {ß}{{\\ss}}2
	    {à}{{\\`a}}1
	    {á}{{\\'a}}1
	    {ä}{{\\\"a}}1
	    {é}{{\\'e}}1
	    {í}{{\\'i}}1
	    {ó}{{\\'o}}1
	    {ö}{{\\\"o}}1
	    {ú}{{\\'u}}1
	    {ü}{{\\\"u}}1
	    {¹}{{\\textsuperscript1}}1
            {²}{{\\textsuperscript2}}1
            {³}{{\\textsuperscript3}}1
	    {ı}{{\\i}}1
	    {—}{{---}}1
	    {’}{{'}}1
	    {…}{{\\dots}}1
            {⮠}{{$\\hookleftarrow$}}1
	    {␣}{{\\textvisiblespace}}1,
	    keywordstyle=\\color{DarkGreen}\\bfseries,
	    identifierstyle=\\color{DarkRed},
	    commentstyle=\\color{Gray}\\upshape,
	    stringstyle=\\color{DarkBlue}\\upshape,
	    emphstyle=\\color{Chocolate}\\upshape,
	    showstringspaces=false,
	    columns=fullflexible,
	    keepspaces=true}
\\usepackage[a4paper,margin=1in,left=1.5in]{geometry}
\\usepackage{parskip}
\\makeatletter
\\renewcommand{\\maketitle}{%
  \\begingroup\\parindent0pt
  \\sffamily
  \\Huge{\\bfseries\\@title}\\par\\bigskip
  \\LARGE{\\bfseries\\@author}\\par\\medskip
  \\normalsize\\@date\\par\\bigskip
  \\endgroup\\@afterindentfalse\\@afterheading}
\\makeatother
[DEFAULT-PACKAGES]
\\hypersetup{linkcolor=Blue,urlcolor=DarkBlue,
  citecolor=DarkRed,colorlinks=true}
\\AtBeginDocument{\\renewcommand{\\UrlFont}{\\ttfamily}}
[PACKAGES]
[EXTRA]"
("\\section{%s}" . "\\section*{%s}")
("\\subsection{%s}" . "\\subsection*{%s}")
("\\subsubsection{%s}" . "\\subsubsection*{%s}")
("\\paragraph{%s}" . "\\paragraph*{%s}")
("\\subparagraph{%s}" . "\\subparagraph*{%s}"))

("report" "\\documentclass[11pt]{report}"
("\\part{%s}" . "\\part*{%s}")
("\\chapter{%s}" . "\\chapter*{%s}")
("\\section{%s}" . "\\section*{%s}")
("\\subsection{%s}" . "\\subsection*{%s}")
("\\subsubsection{%s}" . "\\subsubsection*{%s}"))

("book" "\\documentclass[11pt]{book}"
("\\part{%s}" . "\\part*{%s}")
("\\chapter{%s}" . "\\chapter*{%s}")
("\\section{%s}" . "\\section*{%s}")
("\\subsection{%s}" . "\\subsection*{%s}")
("\\subsubsection{%s}" . "\\subsubsection*{%s}"))))

  
  )

(use-package cdlatex
  :config
  (add-hook 'org-mode-hook #'turn-on-org-cdlatex)
  )

(provide 'my_org)
;;; my_org ends here
