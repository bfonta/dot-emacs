;;; cust_csv --- Summary
;;; Code:
;;; Commentary:

(use-package csv-mode
  :defer t
  :mode ("\\.csv\\'" . csv-mode)
  :config
  ;; change font color of firt member in each row
  ;; other colors: 'font-lock-face '(:foreground "red")
  (add-hook 'csv-mode-hook
			(lambda ()
              (font-lock-add-keywords nil '(("^\\([^,]*\\)," 1 'font-lock-function-name-face)))))
  )

(provide 'cust_csv)
;;; cust_csv ends here
