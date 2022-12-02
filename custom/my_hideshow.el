;;; my_hideshow --- Summary
;;; Code:
;;; Commentary: https://www.emacswiki.org/emacs/HideShow

(defvar hs-special-modes-alist
  (mapcar 'purecopy
  '((c-mode "{" "}" "/[*/]" nil nil)
    (c++-mode "{" "}" "/[*/]" nil nil)
    (bibtex-mode ("@\\S(*\\(\\s(\\)" 1))
    (java-mode "{" "}" "/[*/]" nil nil)
    (js-mode "{" "}" "/[*/]" nil))))

(setq hs-isearch-open 't) ;;"code", "comments" or "t" (both)

;; what to display in folded region (ascii)
(setq buffer-display-table (copy-tree standard-display-table))
(set-display-table-slot buffer-display-table 4
[35 61 61 61 61 61 61 61 61 61 35])

(add-hook 'c-mode-common-hook   'hs-minor-mode)
(add-hook 'c-mode-common-hook   'hs-org/minor-mode)
(add-hook 'lisp-mode-hook       'hs-minor-mode)
(add-hook 'lisp-mode-hook       'hs-org/minor-mode)
(add-hook 'sh-mode-hook         'hs-minor-mode)
(add-hook 'sh-mode-hook         'hs-org/minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-org/minor-mode)
(add-hook 'java-mode-hook       'hs-org/minor-mode)
(add-hook 'java-mode-hook       'hs-minor-mode)
(add-hook 'perl-mode-hook       'hs-org/minor-mode)
(add-hook 'perl-mode-hook       'hs-minor-mode)
(provide 'my_hideshow)
;;; my_hideshow ends here
