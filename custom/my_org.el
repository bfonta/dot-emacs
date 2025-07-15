;;; -*- lexical-binding: nil; -*-

;;; my_org --- Summary
;;; Code:
;;; Commentary: https://emacs.christianbaeuerlein.com/my-org-config.html#orgc3bc9b5 and https://hugocisneros.com/org-config/#faces-setup

(use-package vi-tilde-fringe
  :ensure t
  )

(use-package org
  :mode ("\\.org$" . org-mode)
  :config  
  (global-set-key (kbd "\C-cb") 'org-beamer-export-to-pdf)
  (global-set-key (kbd "\C-c \C-o") 'org-open-at-point) ;;default to go to reference
  (global-set-key (kbd "\C-ci") 'org-toggle-inline-images) ;;default to go to reference

  ;;;###autoload
  (defun my/org-latex-export-to-pdf (choice)
	"Export the master Org file to PDF."
	(interactive
	 (list
	  (let* ((current-file (buffer-file-name)))
		(completing-read
		 "Choose master file or enter custom path: "
		 (list current-file "~/org/PhD/Thesis/thesis.org" "Enter custom path...")
		 nil nil nil nil current-file)))
	 )
	(let ((master-file
		   (if (string= choice "Enter custom path...")
               (read-file-name "Path to the master Org file: ")
			 choice))
          (current-buffer (current-buffer)))
	  (find-file master-file)
	  (org-latex-export-to-pdf)
	  ;;(switch-to-buffer current-buffer)
	  )
	)
  (global-set-key (kbd "\C-cv") 'my/org-latex-export-to-pdf)

  ;;;###autoload
  (defun my/org-mark-ring-goto ()
	"Go back to previous point and reset buffer position."
	(interactive)
	(org-mark-ring-goto)
	;;(winner-undo) TODO: needs some work to work in all buffer configurations
	) ;;C-c <left>
  (global-set-key (kbd "\C-x \C-o") 'my/org-mark-ring-goto) ;;custom to come back to reference

  ;; Org-mode: support shift selection also when cua mode is on
  (setq org-support-shift-select t)


  (defun my/org-call-for-shift-select ()
	""
	(if (and cua-mode
             org-support-shift-select
             (not (use-region-p)))
        (cua-set-mark))
	)
  (eval-after-load "org"
    '(progn
       (eval-after-load "cua-base"
         '(progn            
            (advice-add 'org-call-for-shift-select :before #'my/org-call-for-shift-select-cua)
			)
		 )))
  
  ;; Make windmove work in Org mode:
  (add-hook 'org-shiftup-final-hook 'windmove-up)
  (add-hook 'org-shiftleft-final-hook 'windmove-left)
  (add-hook 'org-shiftdown-final-hook 'windmove-down)
  (add-hook 'org-shiftright-final-hook 'windmove-right)

  ;; imenu-like interface
  (setq org-goto-interface 'outline-path-completionp)
  (setq org-outline-path-complete-in-steps nil)

  ;; always inline images
  (setq org-startup-with-inline-images nil)

  (setq org-image-actual-width nil)
  
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

  ;;;###autoload
  (defun my-org-config/after-org-mode-load ()
	"Once Org mode loaded, turn on olivetti, hide tilde fringes and enable visual line mode."
	(visual-line-mode)
	(vi-tilde-fringe-mode -1))
  (add-hook 'org-mode-hook 'my-org-config/after-org-mode-load)

  ;;;###autoload
  (defun my-org-config/set-base-font ()
    "Sets a fixed width (monospace) font in current buffer."
	(interactive)
	(buffer-face-mode))
  (add-hook 'org-mode-hook 'my-org-config/set-base-font)
  
  ;; Work-related tasks and notes. 
  (defvar org-my-general-files "~/org")

  ;; Private tasks and notes. 
  (defvar org-my-projects-dir "~/org/projects")

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

  ;;;###autoload
  (defun my/style-org ()
	"Beautify. I have removed indentation to make the file look cleaner."

	;; Customize default behaviour of (org-indent-mode 1)
	(setq org-startup-indented t
		  org-indent-indentation-per-level 2
		  org-indent-mode-turns-on-hiding-stars nil)
	
	(setq line-spacing 0.05
          org-pretty-entities t)

	;; fonts and colors (inspired on zenburn theme)
	(let*
		((sans-font
		  ;; (cond ((x-family-fonts "Sans Serif mono") '(:family "Sans Serif"))
		  (cond ((x-family-fonts "DejaVu Sans Mono-10") '(:family "Monospace"))
				(nil (warn "Cannot find a Sans Serif Font.  Install Source Sans Pro."))))
		 (base-font-color     (face-foreground 'default nil 'default))
		 (headline           `(:inherit default :weight regular :foreground ,base-font-color)))
	  
	  (custom-theme-set-faces
	   'user
	   `(org-level-1
		 ((t (,@headline ,@sans-font :weight bold :foreground "#6C3333"))))
	   `(org-level-2
		 ((t (,@headline ,@sans-font :weight bold :foreground "chartreuse4"))))
	   `(org-level-3
		 ((t (,@headline ,@sans-font :weight bold :foreground "#6a5acd"))))
	   `(org-level-4
		 ((t (,@headline ,@sans-font :foreground "#DEB887"))))
	   `(org-level-5
		 ((t (,@headline ,@sans-font :foreground "#BA55D3"))))
	   `(org-level-6
		 ((t (,@headline ,@sans-font :foreground "#5C4033"))))
	   
	   `(org-ellipsis
		 ((t (,@headline ,@sans-font :foreground "#989890"))))
	   `(org-meta-line
		 ((t (,@sans-font :foreground "#989890"))))
	   `(org-drawer
		 ((t (,@sans-font
			  :background "#303030" :foreground "#6CA0A3"))))
	   `(org-verbatim
		 ((t (,@sans-font :foreground "#DC8CC3"))))
	   `(org-cite-face
		 ((t (,@sans-font :weight bold :foreground "#DC8CC3"))))
	   `(org-property-value
		 ((t (,@sans-font
			  :background "#2B2B2B" :foreground "#FFFFEF"))))
	   ;; `(org-checkbox
	   ;; 	 ((t (,@sans-font :foreground "orange4" :background nil))))
	   `(org-block
		 ((t (,@sans-font 
			  :background "gray30" :foreground "#FFFFFD"))))
	   `(org-document-info
		 ((t (,@sans-font :background "#303030"))))
	   `(org-document-info-keyword
		 ((t (,@sans-font :background "#303030"))))
	   `(org-tag
		 ((t (,@sans-font
			  :background "#303030" :foreground "#9FC59F"))))
	   `(org-special-keyword
		 ((t (,@sans-font
			  :background "#303030" :foreground "#9FC59F"))))
	   `(org-tag-group
		 ((t (,@sans-font
			  :background "#303030" :foreground "#9FC59F"))))
	   `(org-verse
		 ((t (,@sans-font :foreground "#9FC59F"))))
	   `(org-block-begin-line
		 ((t
		   (:height 0.75 :weight bold :foreground "gray5" :background "orange4" :box (:style released-button) :extend t))))
	   `(org-block-end-line
		 ((t
		   (:height 0.75 :weight bold :foreground "gray5" :background "orange4" :box (:style released-button) :extend t))))
	   `(org-code
		 ((t (,@sans-font :height 0.65 :foreground "#7F9F7F"))))
	   `(org-link
		 ((t (,@sans-font
			  :foreground "#93E0E3" :underline (:color foreground-color :style line) ))))
	   `(org-table
		 ((t (,@sans-font :foreground "#9FC59F"))))
	   `(org-document-title
		 ((t (,@sans-font
			  :foreground "#6C3333" :underline nil))))
	   )
	  )
	)

  (add-hook 'org-mode-hook (lambda ()
							 "Beautify Org Checkbox Symbol"
							 (push '("[ ]" . " ") prettify-symbols-alist) ;U+2001
							 (push '("[X]" . "✓" ) prettify-symbols-alist)
							 (push '("[-]" . " " ) prettify-symbols-alist) ;U+2001
							 (prettify-symbols-mode)))
  
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
                               '((shell . t)
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

  ;; enlarge and shrink windows while in an org-mode buffer
  (define-key org-mode-map (kbd "S-C-<left>") 'shrink-window-horizontally)
  (define-key org-mode-map (kbd "S-C-<right>") 'enlarge-window-horizontally)
  (define-key org-mode-map (kbd "S-C-<down>") 'shrink-window)
  (define-key org-mode-map (kbd "S-C-<up>") 'enlarge-window)

  ;;;###autoload
  (defun my/org-copy-link (&optional arg)
    "Extract URL from org-mode link and add it to kill ring."
    (interactive "P")
    (let* ((link (org-element-lineage (org-element-context) '(link) t))
           (type (org-element-property :type link))
           (url (org-element-property :path link))
           (url (concat type ":" url)))
      (kill-new url)
      (message (concat "Copied URL: " url))))
  (define-key org-mode-map (kbd "C-x C-l") 'my/org-copy-link)
  (define-key org-mode-map (kbd "S-<return>") 'org-insert-heading)

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

  ;; To make \ref and \cref commands work in LaTeX
  ;; https://superuser.com/questions/702070/how-do-i-add-a-label-to-a-figure-in-an-org-mode-file-that-im-going-to-export
  (setq org-latex-prefer-user-labels t) 

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

;; replace list bullet
(font-lock-add-keywords 'org-mode
						'(("^[[:space:]]*\\([\*]\\) "
                           (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "▶"))))
						  ("^[[:space:]]*\\([\*][\*]\\) "
                           (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "▶"))))
						  ("^[[:space:]]*\\([\*][\*][\*]\\) "
                           (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "▶"))))
						  ("^[[:space:]]*\\([\*][\*][\*][\*]\\) "
                           (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "⊙"))))
						  ("^[[:space:]]*\\([\*][\*][\*][\*][\*]\\) "
                           (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "⊙"))))
						  ("^[[:space:]]*\\([\*][\*][\*][\*][\*][\*]\\) "
                           (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "⊙"))))
						  ("^[[:space:]]*\\([\+]\\) "
                           (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))
						  ("^[[:space:]]*\\([\-]\\) "
                           (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))
						  ("\\(->\\)"
                           (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "→"))))
						  ("\\(<-\\)"
                           (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "←"))))
						  ))

(use-package org-roam
  :after org
  :config
  (setq org-roam-directory (file-truename "~/org/org-roam"))

  ;; If you're using a vertical completion framework, you might want a more informative completion interface
  (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag))
		org-roam-db-autosync-enable t)
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
  )

;; (use-package cdlatex
;;   :config
;;   (add-hook 'org-mode-hook #'turn-on-org-cdlatex)
;;   )

;; set caption to stay below the table when exporting to tex/pdf
(setq org-latex-caption-above nil)

;; Type of emphasis used between spcific characters
(setq org-emphasis-alist
	  '(("*" (bold :foreground "Orange"))
		("/" italic)
		("_" underline)
		("=" org-verbatim)
		("~" org-verse)
		;("+" (:strike-through t))
		))

(defface dollar-face
  '((t (:foreground "orange")))
  "Face for dollar sign")
(font-lock-add-keywords 'org-mode '(("\\<$.*?$\\>" . 'dollar-face)))

(setq org-pretty-entities nil
	  org-pretty-entities-include-sub-superscripts nil
	  org-use-sub-superscripts "{}")

(defface cite-face
  '((t (:italic t :foreground "slate gray")))
  "Face for cite sign")
(font-lock-add-keywords 'org-mode '(("cite:\&" . 'cite-face)))

(defface comment-face
  '((t (:weight bold :foreground "red")))
  "Face for dollar sign")
(font-lock-add-keywords 'org-mode '(("\\(@[^@\n]+@\\)" . 'comment-face)))

(require 'org-mouse) ;; clickable items
(defvar my-org-mouse-map (make-sparse-keymap))
(org-defkey my-org-mouse-map [mouse-1] 'org-cycle)
(add-hook 'org-mode-hook
          (defun my-org-mouse-map-hook ()
            (font-lock-add-keywords
             nil
             `((,(rx (and bol (one-or-more "*") (one-or-more space) (group-n 1 (one-or-more any)) eol))
                (0
                 `(
                   face nil
                   keymap ,my-org-mouse-map
                   mouse-face highlight
                   )
                 prepend)))
             t)))

;; alternated color stripes in dired
(add-to-list 'load-path "~/dot-emacs/stripes/")
(load-library "stripe-buffer")
(add-hook 'org-mode-hook 'turn-on-stripe-table-mode)

;; exports correctly single quotes, double quotes, and apostrophes.
(setq org-export-with-smart-quotes t)

;; disables png opening in org-mode, to allow inline image display
(defun my/no-openwith ()
  (openwith-mode -1))
(add-hook 'org-mode-hook #'my/no-openwith)

(provide 'my_org)
;;; my_org ends here
