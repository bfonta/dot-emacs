;;; cust_pastebuffer --- Summary
;;; Code:
;;; Commentary:

(use-package webpaste
  :defer t
  :after (:all yaml-mode)
  :ensure t
  :bind (("C-c C-p C-b" . webpaste-paste-buffer)
         ("C-c C-p C-r" . webpaste-paste-region)
         ("C-c C-p C-p" . webpaste-paste-buffer-or-region))
  :config
  (progn
    (setq webpaste-provider-priority '("dpaste.org" "paste.mozilla.org" "bpa.st"))
    (setq webpaste-paste-confirmation nil)
    (setq webpaste-open-in-browser t)
    (setq webpaste-paste-raw-text nil))
  (setq browse-url-generic-program (executable-find "firefox") )
  )

(provide 'cust_pastebuffer)
;;; cust_pastebuffer ends here
