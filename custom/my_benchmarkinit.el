;;; cust_benchmarkinit --- Summary
;;; Code: 
;;; Commentary: https://github.com/dholm/benchmark-init-el

;; benchmark emacs initialization
;; run `benchmark-init/show-durations-tabulated` after opening emacs
(use-package benchmark-init
  :ensure t
  :config
  ;; To disable collection of benchmark data after init is done.
  (add-hook 'after-init-hook 'benchmark-init/deactivate))

(provide 'cust_benchmarkinit)
;;; cust_benchmarkinit ends here
