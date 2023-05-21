;;; my_biblio --- Summary
;;; Code:
;;; Commentary: https://github.com/tmalsburg/helm-bibtex

(use-package org-ref
  ;; :after (org)
  :config
  (add-hook 'org-mode-hook (lambda () (local-set-key (kbd "C-c ]") 'org-ref-insert-cite-link)))
  (add-hook 'org-mode-hook (lambda () (local-set-key (kbd "C-c [") 'helm-bibtex-with-local-bibliography)))
  (add-hook 'org-mode-hook (lambda () (local-set-key (kbd "C-c n") 'org-noter)))
  ;;(setq org-ref-default-citation-link "autocite")
  ;;(org-ref-define-citation-link "citez" ?z)
  )

(use-package helm-bibtex
  :after (org-ref)
  :config
  (setq bibtex-completion-library-path "~/Documents/Library/"
		bibtex-completion-bibliography '("~/dot-emacs/bibliography/references/l1.bib"
										 "~/dot-emacs/bibliography/references/gpu.bib"
										 "~/dot-emacs/bibliography/references/stats.bib"
										 "~/dot-emacs/bibliography/references/hgcal.bib"
										 "~/dot-emacs/bibliography/references/higgs.bib"
										 "~/dot-emacs/bibliography/references/mtd.bib")
		bibtex-completion-additional-search-fields '(tags journal)
		bibtex-completion-notes-symbol "✎"
		bibtex-completion-pdf-symbol "📁"
		bibtex-completion-pdf-field "file"
		bibtex-completion-notes-path "~/dot-emacs/bibliography/notes.org"
		org-cite-follow-processor 'helm-bibtex-org-cite-follow
		bibtex-completion-format-citation-functions
		'((org-mode		 . bibtex-completion-format-citation-org-link-to-PDF)
          (latex-mode    . bibtex-completion-format-citation-cite)
          (markdown-mode . bibtex-completion-format-citation-pandoc-citeproc)
          (default       . bibtex-completion-format-citation-default))
		bibtex-completion-display-formats
		'(;;(techreport . "${title:40} ${year:4} ${author:25} ${=has-pdf=:1}${=has-note=:1} ${tags:20}")
		  (t . "${title:40} ${year:4} ${author:25} ${journal:20} ${=has-pdf=:1}${=has-note=:1} ${tags:20}")))
  )

(use-package org-noter
  :after (:any org)
  :config
  (setq
   ;; The WM can handle splits
   org-noter-notes-window-location 'other-frame
   ;; Please stop opening frames
   org-noter-always-create-frame nil
   ;; I want to see the whole file
   org-noter-hide-other nil
   ;; Everything is relative to the main notes file
   org-noter-notes-search-path "~/dot-emacs/bibliography/"))


(provide 'my_biblio)
;;; my_biblio ends here
