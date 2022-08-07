;;; my_company --- Summary
;;; Code:
;;; Commentary:

(use-package company
  :config
  (when window-system 
    (add-hook 'prog-mode-hook 'company-mode)
    (setq company-idle-delay 0) ; No delay in showing suggestions.
    (setq company-minimum-prefix-length 2 ; Show suggestions after entering two characters.
		  company-selection-wrap-around t ; connect end and start of suggestion list
		  company-dabbrev-downcase nil ; avoid downcase
		  company-idle-delay 0.0
		  company-tng-configure-default 0 ; Use tab key to cycle through suggestions ('tng' means 'tab and go')
		  company-require-match nil            ; Don't require match, so you can still move your cursor as expected.
          company-tooltip-align-annotations t  ; Align annotation to the right side.
          company-eclim-auto-save nil          ; Stop eclim auto save.
          company-dabbrev-downcase nil )
    )
  )

(use-package company-quickhelp
  :after company
  :config
  (setq company-quickhelp-delay 0)
  (add-hook 'prog-mode-hook 'company-quickhelp-mode)
  )


(use-package flx
  )
;;; Reference: https://github.com/jcs-elpa/company-fuzzy
(use-package company-fuzzy
  :hook (company-mode . company-fuzzy-mode)
  :after flx
  :init
  (setq company-fuzzy-sorting-backend 'flx
		company-fuzzy-prefix-on-top nil
		;; include tags like <dabbrev>, <cmake>, ...
		company-fuzzy-show-annotation nil 
		company-fuzzy-history-backends '(company-yasnippet)
		company-fuzzy-passthrough-backends '(company-cmake)
		company-fuzzy-trigger-symbols '("." "->" "<" "\"" "'" "@")
		;; delete the very annoying cmake completion
		;; for major-mode-local removal seed
		;; https://emacs.stackexchange.com/questions/20485/how-to-exclude-a-company-backend-from-autocompleting-without-globally-removing-i
		company-backends (delete 'company-cmake company-backends))
  (global-company-fuzzy-mode 1)
  )

(provide 'my_company)
;;; my_company ends here
