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

;;; References: https://github.com/antonj/Highlight-Indentation-for-Emacs/blob/master/highlight-indentation.el https://github.com/antonj/Highlight-Indentation-for-Emacs/issues/16
(add-to-list 'load-path "~/dot-emacs/highlight-indentation/")
(load-library "highlight-indentation")
(set-face-attribute 'highlight-indentation-face nil
                    :stipple (list 8 4 (string 16 16 16 16))
                    :inherit nil
					:foreground "peru")
(setq highlight-indentation-blank-lines t)

(setq-default tab-width 4)

(provide 'my_python)
;;; my_python ends here

