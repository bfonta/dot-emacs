;;; cust_align --- Summary
;;; Code:
;;; Commentary:

;; https://stackoverflow.com/questions/22710040/emacs-align-regexp-with-spaces-instead-of-tabs
(defadvice align-regexp (around align-regexp-with-spaces activate)
  (let ((indent-tabs-mode nil))
    ad-do-it))

(provide 'cust_align)
;;; cust_align ends here
