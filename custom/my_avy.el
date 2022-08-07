;;; avy --- Summary
;;; Code:
;;; Commentary:

(use-package avy
  :ensure t
  :init (avy-setup-default)
  :config (progn
			;; Makes it easier to see the candidates
			(setq avy-background t)
			;; Shows both the candidates over the text
			(setq avy-styles-alist '((avy-goto-char-2 . at-full))))
  :bind (;; Search by first char of a word
		 ("M-s" . avy-goto-word-1)
		 ;; Search by 2 chars
		 ("M-s s" . avy-goto-char-2)
		 ("M-g M-g" . avy-goto-line))
  :config (setq avy-all-windows nil)
  )
