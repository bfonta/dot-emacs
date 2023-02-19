;;; my_biblio --- Summary
;;; Code:
;;; Commentary:

(use-package org-ref
  :after (org)
  :config
  (add-hook 'org-mode-hook (lambda () (local-set-key (kbd "C-c ]") 'org-ref-insert-cite-link)))
  (add-hook 'org-mode-hook (lambda () (local-set-key (kbd "C-c [") 'helm-bibtex-with-local-bibliography)))
  ;;(setq org-ref-default-citation-link "autocite")
  ;;(org-ref-define-citation-link "citez" ?z)
  )

(use-package helm-bibtex
  :after (org-ref)
  :config
  (setq bibtex-completion-library-path "~/Documents/Library/"
		bibtex-completion-bibliography '("~/dot-emacs/bibliography/l1.bib"
										 "~/dot-emacs/bibliography/gpu.bib")
		bibtex-completion-additional-search-fields '(keywords note journal booktitle) ; search in tags and notes
		bibtex-completion-notes-symbol "✎"
		bibtex-completion-pdf-symbol "📁"
		bibtex-completion-notes-path "~/dot-emacs/bibliography/notes.org"
		org-cite-follow-processor 'helm-bibtex-org-cite-follow
		bibtex-completion-pdf-field "file"
		bibtex-completion-format-citation-functions
		'((org-mode		 . bibtex-completion-format-citation-org-link-to-PDF)
          (latex-mode    . bibtex-completion-format-citation-cite)
          (markdown-mode . bibtex-completion-format-citation-pandoc-citeproc)
          (default       . bibtex-completion-format-citation-default))
		bibtex-completion-display-formats
		'((techreport    . "${author:25} ${title:40} ${year:4} ${=has-pdf=:1}${=has-note=:1} ${=type=:3}")
		  (t             . "${author:25} ${title:40} ${year:4} ${journal:20} ${=has-pdf=:1}${=has-note=:1} ${=type=:3}")))
  )

(provide 'my_biblio)
;;; my_biblio ends here
