;;; my_python --- Summary
;;; Code:
;;; Commentary:

(use-package python-mode
  :bind (("C->" . python-indent-shift-right)
		 ("C-<" . python-indent-shift-left))

  :config
  ;; originally linked weirdly-behaving `py-electric-backspace`
  (define-key python-mode-map (kbd "<backspace>") nil)
  (define-key python-mode-map (kbd "DEL") nil)

  (defun my-merge-imenu ()
	(interactive)
	(let ((mode-imenu (imenu-default-create-index-function))
          (custom-imenu (imenu--generic-function imenu-generic-expression)))
      (append mode-imenu custom-imenu)))

  (defun my-python-hooks()
    (interactive)
    (setq tab-width 4
          python-indent 4
		  indent-tabs-mode nil)
    (add-to-list
     'imenu-generic-expression
     '("Sections" "^#### \\[ \\(.*\\) \\]$" 1))
    (setq imenu-create-index-function 'my-merge-imenu)
	)
  (add-hook 'python-mode-hook 'my-python-hooks))

(use-package pyvenv
  :defer t
  :after python-mode
  :config
  (setenv "WORKON_HOME" "/home/bruno/miniconda3/envs")
  (pyvenv-mode 1)
  )

(provide 'my_python)
;;; my_python ends here

