;;; my_biblio --- Summary
;;; Code:
;;; Commentary: https://github.com/tmalsburg/helm-bibtex

(use-package org-ref
  :after (org)
  :config
  (add-hook 'org-mode-hook (lambda () (local-set-key (kbd "C-c ]") 'org-ref-insert-cite-link)))
  (add-hook 'org-mode-hook (lambda () (local-set-key (kbd "C-c [") 'org-ref-insert-ref-link)))
  )

(use-package helm-bibtex
  :after (org-ref)
  :config
  (setq bibtex-completion-library-path "~/Documents/Library/"
		bibtex-completion-bibliography '("~/dot-emacs/bibliography/references/trigger.bib"
										 "~/dot-emacs/bibliography/references/gpu.bib"
										 "~/dot-emacs/bibliography/references/stats.bib"
										 "~/dot-emacs/bibliography/references/higgs.bib"
										 "~/dot-emacs/bibliography/references/mtd.bib"
										 "~/dot-emacs/bibliography/references/mc_generation.bib"
										 "~/dot-emacs/bibliography/references/pure_software.bib"
										 "~/dot-emacs/bibliography/references/physics.bib"
										 "~/dot-emacs/bibliography/references/detector.bib"
										 "~/dot-emacs/bibliography/references/astrophysics.bib"
										 "~/dot-emacs/bibliography/references/biology.bib")
		bibtex-completion-additional-search-fields '(tags journal)
		;bibtex-completion-notes-symbol "✎"
		;bibtex-completion-pdf-symbol "📁"
		bibtex-completion-pdf-field "file"
		org-cite-follow-processor 'helm-bibtex-org-cite-follow
		bibtex-completion-format-citation-functions
		'((org-mode		 . bibtex-completion-format-citation-org-link-to-PDF)
          (latex-mode    . bibtex-completion-format-citation-cite)
          (markdown-mode . bibtex-completion-format-citation-pandoc-citeproc)
          (default       . bibtex-completion-format-citation-default))
		bibtex-completion-display-formats
		'(;;(techreport . "${title:40} ${year:4} ${author:25} ${=has-pdf=:1}${=has-note=:1} ${tags:20}")
		  (t . "${title:80} ${year:4} ${author:10} ${journal:3} ${=has-pdf=:1}${=has-note=:1} ${tags:200}")))
  :bind
  ("C-c p" . helm-bibtex) ;; (global-set-key (kbd "C-c p") 'helm-bibtex)
  )

(provide 'my_biblio)
;;; my_biblio ends here
