;;; my_pdf --- Summary
;;; Code:
;;; Commentary:

(use-package pdf-tools
  :defer t
  ;; deactivate linum mode: it does not work well with pdf-tools
  :hook (pdf-view-mode . (lambda() (linum-mode -1)))
  ;; the :hook above should be equivalent to the following :init
  ;; (add-hook 'pdf-view-mode-hook (lambda() (linum-mode -1)))
  :mode ("\\.pdf\\'" . pdf-view-mode)
  ;; `:mode` is equivalent to:
  ;; (add-to-list 'auto-mode-alist '("\\.tsx?\\'" . typescript-mode))
  :config
  (pdf-tools-install :no-query) ;; initialise
  (setq-default pdf-view-display-size 'fit-page) ;; open pdfs scaled to fit page
  (setq pdf-annot-activate-created-annotations t) ;; automatically annotate highlights
  (define-key pdf-view-mode-map (kbd "C-s") 'isearch-forward) ;; use normal isearch
  )

(provide 'my_pdf)
;;; my_pdf.el ends here
