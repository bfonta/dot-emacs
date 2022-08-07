;;; my_tex --- Summary
;;; Code:
;;; Commentary:

(defun reduce-this-window-width ()
  "Expand current window to use half of the other window's lines."
  (shrink-window-horizontally (/ (window-width (next-window)) 5)))
(defun my-TeX-command-run-all (arg)
  (interactive "P")
  (TeX-command-run-all arg)
  (reduce-this-window-width)
  (pdf-view-auto-slice-minor-mode)
  (pdf-view-fit-width-to-window)
  )
(add-hook 'LaTeX-mode-hook
		  (lambda () (local-set-key (kbd "C-c C-a") #'my-TeX-command-run-all)))

(use-package auctex
  :defer t
  :init
  (setq
   split-width-threshold 80
   split-height-threshold nil)

  (setq-default TeX-master nil)
  ;; display PDF
  ;; (setq TeX-view-program-selection '((output-pdf "PDF Tools"))
  ;; 		TeX-view-evince-keep-focus t
  ;; 		TeX-source-correlate-start-server t )
  (setq TeX-auto-save t
		TeX-parse-self t
		TeX-PDF-mode t)
  ;; Reftex
  (setq reftex-plug-into-AUCTeX t)
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

  (defadvice TeX-LaTeX-sentinel
      (around mg-TeX-LaTeX-sentinel-open-output activate)
	"Open output when there are errors."
	;; Run `TeX-LaTeX-sentinel' as usual.
	ad-do-it
	;; Check for the presence of errors.
	(when
		(with-current-buffer TeX-command-buffer
          (plist-get TeX-error-report-switches (intern (TeX-master-file))))
      ;; If there are errors, open the output buffer.
      (TeX-recenter-output-buffer nil)))

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

(provide 'my_tex)
;;; my_gitlink ends here
