;;; -*- lexical-binding: nil; -*-

;;; my_gitlink --- Summary
;;; Code:
;;; Commentary:

(when window-system 
  (add-to-list 'load-path "~/dot-emacs/git-link/") ;; using deprecated 'cl' package
  (require 'git-link)
  (setq git-link-open-in-browser t
		git-link-use-single-line-number t
		git-link-default-remote "origin"
		git-link-use-commit t)
  )

;; (use-package git-link
;;   :ensure t
;;   :config
;;   (git-link-open-in-browser t)
;;   (git-link-use-single-line-number t)
;;   (git-link-default-remote "origin")
;;   (git-link-use-commit t)
;;   )

(provide 'my_gitlink)
;;; my_gitlink ends here
