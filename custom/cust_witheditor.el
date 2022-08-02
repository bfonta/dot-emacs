;;; cust_witheditor --- Summary
;;; Code:
;;; Commentary: Uses the magit with-editor package (locally installed) https://github.com/magit/with-editor

(add-to-list 'load-path "~/.emacs.d/with-editor/")
(load-library "with-editor")

(use-package with-editor
  :ensure t
  :commands (with-editor-export-editor with-editor-shell-command with-editor-async-shell-command)
  :bind (([remap shell-command]       . with-editor-shell-command)
         ([remap async-shell-command] . with-editor-async-shell-command))
  :init (dolist (hook '(shell-mode-hook term-exec-hook eshell-mode-hook))
          (dolist (envvar with-editor-envvars)
            (add-hook hook (apply-partially 'with-editor-export-editor envvar)))))

(provide 'cust_witheditor)
;;; cust_witheditor ends here
