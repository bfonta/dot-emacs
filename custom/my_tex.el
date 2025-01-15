;;; my_tex --- Summary
;;; Code:
;;; Commentary: 

;; https://emacs.stackexchange.com/questions/41321/when-to-specify-a-package-name-in-use-packages-ensure-tag/41324#41324
(use-package tex
  :ensure auctex
  :init
  (setq split-width-threshold 80
		split-height-threshold nil)

  (setq-default TeX-master nil)
  ;; display PDF
  (setq TeX-source-correlate-mode t
		TeX-source-correlate-start-server t
		TeX-view-program-selection
		'(((output-dvi has-no-display-manager) "dvi2tty")
		  ((output-dvi style-pstricks) "dvips and gv")
		  (output-pdf "Okular")
		  (output-dvi "xdvi")
		  (output-html "xdg-open"))
		TeX-auto-save t
		TeX-parse-self t
		TeX-PDF-mode t
		;; Reftex
		reftex-plug-into-AUCTeX t)

  :mode
  ("\\.tex\\'" . tex-mode)

  :config
  (company-auctex-init)
  
  ;;Syntax Higlight
  (add-hook 'LaTeX-mode-hook 'turn-on-font-lock)
  ;; Mathe Modus
  (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
  ;; Reftex
  (add-hook 'LaTeX-mode-hook 'turn-on-reftex)

  (defun my/TeX-LaTeX-sentinel ()
	"Open output when there are errors."
	;; Run `TeX-LaTeX-sentinel' as usual.
	ad-do-it
	;; Check for the presence of errors.
	(when
		(with-current-buffer TeX-command-buffer
          (plist-get TeX-error-report-switches (intern (TeX-master-file))))
      ;; If there are errors, open the output buffer.
      (TeX-recenter-output-buffer nil)))
  (advice-add 'TeX-LaTeX-sentinel :around #'my/TeX-LaTeX-sentinel)

  ;; ensure synching between source and pdf
  (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex --synctex=1%(mode)%' %t" TeX-run-TeX nil t :help "Run XeLaTeX"))

  ;; folding common keywords
  (push '("[ref]" ("cref")) LaTeX-fold-macro-spec-list)
  (push '("[cap]" ("caption")) LaTeX-fold-macro-spec-list)
  (push '("[equation]" ("equation")) LaTeX-fold-env-spec-list)
  (push '("[figure]" ("figure")) LaTeX-fold-env-spec-list)
  (push '("[table]" ("table")) LaTeX-fold-env-spec-list)
  (push '("[frame]" ("frame")) LaTeX-fold-env-spec-list)
  (push '("[columns]" ("columns")) LaTeX-fold-env-spec-list)
  (add-hook 'LaTeX-mode-hook (lambda ()
                               (TeX-fold-mode 1)))

  (add-to-list 'TeX-outline-extra '("\\\\frametitle\\b" 4))

  ;; Update PDF buffers after successful LaTeX runs
  (add-hook 'TeX-after-compilation-finished-functions
			#'TeX-revert-document-buffer)
  )

;; enables to use @EMAIL@ anywhere and replace it with the email address when exporting to latex
;; https://stackoverflow.com/questions/67738804/orgmode-latex-export-email-is-not-exported
;; (defun nd-email-filter (contents backend info)
;;   (let ((email (plist-get info :email)))
;;     (replace-regexp-in-string "@EMAIL@" email contents t)))
;; (add-to-list 'org-export-filter-final-output-functions (function nd-email-filter))

;;(with-eval-after-load 'ox-latex
(add-to-list 'org-latex-classes
             '("org-plain-latex"
			   "\\documentclass{article}
                [NO-DEFAULT-PACKAGES]
                [PACKAGES]
                [EXTRA]"
      		   ("\\section{%s}" . "\\section*{%s}")
			   ("\\subsection{%s}" . "\\subsection*{%s}")
			   ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
			   ("\\paragraph{%s}" . "\\paragraph*{%s}")
			   ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
(add-to-list 'org-latex-classes
             '("mimosis"
			   "\\documentclass{mimosis}
                [NO-DEFAULT-PACKAGES]
                [PACKAGES]
                [EXTRA]"
			   ))
(add-to-list 'org-latex-classes
             '("pos"
			   "\\documentclass[a4paper,11pt]{article}
               \\usepackage{pos}
               [NO-DEFAULT-PACKAGES]
               [PACKAGES]
			   [EXTRA]"
               ("\\section{%s}" . "\\section*{%s}")
			   ("\\subsection{%s}" . "\\subsection*{%s}")
			   ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
			   ("\\paragraph{%s}" . "\\paragraph*{%s}")
			   ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
;; )

(defalias 'my/tex-newline
   (kmacro "% <return>"))

;;;###autoload
(defun my/LaTeX-insert-item ()
  "Insert a new item in an environment.
You may use `LaTeX-item-list' to change the routines used to insert 
the item."
  (interactive "*")
  (let ((environment (LaTeX-current-environment)))
    (when (and (TeX-active-mark)
			   (> (point) (mark)))
      (exchange-point-and-mark))
    (unless (bolp) (LaTeX-newline))

	(cond
	 ((string-equal environment "document")
	  (my/tex-newline))
	 (t
      (if (assoc environment LaTeX-item-list)
		  (funcall (cdr (assoc environment LaTeX-item-list)))
		(TeX-insert-macro "item")))
     (indent-according-to-mode))))
(advice-add 'LaTeX-insert-item :override #'my/LaTeX-insert-item)

;;;###autoload
(defun reduce-this-window-width ()
  "Expand current window to use half of the other window's lines."
  (shrink-window-horizontally (/ (window-width (next-window)) 5)))

;; ;;;###autoload
;; (defun my/TeX-command-run-all (arg)
;;   (interactive "P")
;;   (TeX-command-run-all arg)
;;   (reduce-this-window-width)
;;   )
;; (add-hook 'LaTeX-mode-hook
;; 		  (lambda () (local-set-key (kbd "C-c C-a") #'my/TeX-command-run-all)))

(provide 'my_tex)
;;; my_gitlink ends here


