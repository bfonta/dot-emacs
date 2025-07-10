;;; -*- lexical-binding: nil; -*-

;;; my_python --- Summary
;;; Code:
;;; Commentary:

(use-package python-mode
  :bind (("C->" . python-indent-shift-right)
		 ("C-<" . python-indent-shift-left))
  )

;;;###autoload
(defun my/merge-imenu ()
  (interactive)
  (let ((mode-imenu (imenu-default-create-index-function))
        (custom-imenu (imenu--generic-function imenu-generic-expression)))
    (append mode-imenu custom-imenu)))

(use-package pyvenv
  :defer t
  :after python-mode
  :config
  (setenv "WORKON_HOME" "/home/bruno/miniconda3/envs")
  (pyvenv-mode 1)
  )

(when (executable-find "ipython")
  (setq python-shell-interpreter "ipython"
        python-shell-interpreter-args "-i --simple-prompt --InteractiveShell.display_page=True"
		python-shell-completion-native-enable nil))

;;;###autoload
(defun my-python-hooks()
  (interactive)
  (setq tab-width 4
        python-indent 4
		indent-tabs-mode nil)
  (add-to-list
   'imenu-generic-expression
   '("Sections" "^#### \\[ \\(.*\\) \\]$" 1))
  (setq imenu-create-index-function 'my/merge-imenu)
  )
(add-hook 'python-mode-hook 'my-python-hooks)

;;; References: https://github.com/antonj/Highlight-Indentation-for-Emacs/blob/master/highlight-indentation.el https://github.com/antonj/Highlight-Indentation-for-Emacs/issues/16
(add-to-list 'load-path "~/dot-emacs/highlight-indentation/")
(load-library "highlight-indentation")
(set-face-attribute 'highlight-indentation-face nil
                    :stipple (list 8 4 (string 16 16 16 16))
                    :inherit nil
					:foreground "peru")
(setq highlight-indentation-blank-lines t)

(setq-default tab-width 4)

;;;###autoload
(defun add-py-debug ()  
      "add debug code and move line down"  
    (interactive)  
    (move-beginning-of-line 1)  
    (insert "breakpoint();\n"))  
(local-set-key (kbd "<f8>") 'add-py-debug)

;;;###autoload
(defun remove-py-debug ()  
  "remove py debug code, if found"  
  (interactive)  
  (let ((x (line-number-at-pos))  
    (cur (point)))  
    (search-forward-regexp "^[ ]*breakpoint()")  
    (if (= x (line-number-at-pos))  
    (let ()  
      (move-beginning-of-line 1)  
      (kill-line 1)  
      (move-beginning-of-line 1))  
      (goto-char cur))))  
(local-set-key (kbd "<f9>") 'remove-py-debug)

(local-set-key (kbd "<f7>") '(lambda ()  
                               (interactive)   
                               (search-forward-regexp "^[ ]*breakpoint()")
                               (move-beginning-of-line 1)))
(provide 'my_python)
;;; my_python ends here

