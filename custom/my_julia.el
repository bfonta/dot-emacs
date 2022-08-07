;;; cust_julia --- Summary
;;; Code:
;;; Commentary:

; also works for R
(use-package ess
  :defer t
  :mode (
         ("\\.jl\\'" . ess-mode)
         ("\\.R\\'"  . ess-mode)
         ("\\.r\\'"  . ess-mode)
	 )
  )

;; julia-mode
;; dependency for the ess-julia-mode-hook
(use-package julia-mode
  :mode ("\\.jl\\'" . ess-mode)
  :init
  (add-hook 'julia-mode-hook 'ess-julia-mode)
  )

;; ====================
;; for ein (jupyter)
(use-package ein
  :defer t)

(use-package 'ein
  :defer t
  )
(use-package 'ein-notebook
  :defer t
  )
(use-package 'ein-subpackages
  :defer t
  )

;;; cust_julia ends here
