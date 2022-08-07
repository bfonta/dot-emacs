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
		 ("C-c a" . avy-goto-word-1)
		 ;; Search by 2 chars
		 ("C-c s" . avy-goto-char-2)
		 ("C-c g" . avy-goto-line))
  :config (setq avy-all-windows nil)
  )
