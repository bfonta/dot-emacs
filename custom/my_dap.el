;;; my_dap --- Summary
;;; Code:
;;; Commentary: https://github.com/daviwil/emacs-from-scratch/blob/210e517353abf4ed669bc40d4c7daf0fabc10a5c/Emacs.org#debugging-with-dap-mode

(use-package dap-mode
  :after lsp-mode
  :after with-venv
  :commands dap-debug
  :hook (
		 (python-mode . dap-ui-mode)
		 (python-mode . dap-mode)
		 )
  :config
  (eval-when-compile
    (require 'cl))
  (require 'dap-python)
  (require 'dap-lldb)

  ;; Temporal fix
  (defun dap-python--pyenv-executable-find (command)
    (with-venv (executable-find "python")))

  ;; Uncomment the config below if you want all UI panes to be hidden by default!
  ;; :custom
  ;; (lsp-enable-dap-auto-configure nil)
  ;; :config
  ;; (dap-ui-mode 1)

  :config
  ;; Set up Node debugging
  (require 'dap-node)
  (dap-node-setup) ;; Automatically installs Node debug adapter if needed

  ;; Bind `C-c l d` to `dap-hydra` for easy access
  (define-key dap-hydra (kbd "C-c l d") nil)

  (dap-register-debug-template "Local Python"
							   (list :type "python"
									 :args "-i"
									 :cwd nil
									 :env '(("DEBUG" . "1"))
									 ;; :target-module (expand-file-name "~/src/myapp/.env/bin/myapp")
									 :request "launch"
									 :name "Local Python"))
  
  )

(provide 'my_dap)
;;; my_dap ends here
