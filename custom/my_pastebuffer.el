;;; -*- lexical-binding: nil; -*-

;;; my_pastebuffer --- Summary
;;; Code:
;;; Commentary:

(use-package webpaste
  :ensure t
  ;;:after (:all yaml-mode)
  :bind (("C-c C-p C-b" . webpaste-paste-buffer)
         ("C-c C-p C-r" . webpaste-paste-region)
         ("C-c C-p C-p" . webpaste-paste-buffer-or-region))
  :config
  (setq webpaste-provider-priority '("bpa.st" "paste.mozilla.org")
		webpaste-paste-confirmation nil
		webpaste-open-in-browser t
		webpaste-paste-raw-text nil
		browse-url-generic-program (executable-find "firefox"))
)

(provide 'my_pastebuffer)
;;; my_pastebuffer ends here
