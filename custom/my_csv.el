;;; -*- lexical-binding: nil; -*-

;;; cust_csv --- Summary
;;; Code:
;;; Commentary: copy locally and load file directly due to the MELPA `csv-mode-` bug


(add-to-list 'load-path "~/dot-emacs/csv-mode/")
(load-library "csv-mode")

(setq csv-align-mode t)
(add-hook 'csv-mode-hook
		  (lambda ()
            (font-lock-add-keywords nil '(("^\\([^,]*\\)," 1 'font-lock-function-name-face)))))
;; (use-package csv-mode
;;   :defer t
;;   :mode ("\\.csv\\'" . csv-mode)
;;   :config
;;   ;; change font color of firt member in each row
;;   ;; other colors: 'font-lock-face '(:foreground "red")
;;   (setq csv-align-mode t)
;;   (add-hook 'csv-mode-hook
;; 			(lambda ()
;;               (font-lock-add-keywords nil '(("^\\([^,]*\\)," 1 'font-lock-function-name-face)))))
;;   )

;;;###autoload
(defun my/modify-csv-syntax-table ()
  (modify-syntax-entry ?_ "w")
  (modify-syntax-entry ?- "w")
  (modify-syntax-entry ?: "w")
  (modify-syntax-entry ?/ "w")
  (modify-syntax-entry ?. "w")
  )
(add-hook 'csv-mode-hook 'my/modify-csv-syntax-table)

(provide 'cust_csv)
;;; cust_csv ends here
