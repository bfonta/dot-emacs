;;; cust_cpp --- Summary
;;; Code:
;;; Commentary: https://emacs-lsp.github.io/lsp-mode/page/installation/

(use-package lsp-mode
  :init
  ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
  (setq lsp-keymap-prefix "C-c l")
  :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
         (XXX-mode . lsp)
         ;; if you want which-key integration
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp
  :config
  (add-hook 'c-mode-hook 'lsp)
  (add-hook 'c++-mode-hook 'lsp)
  
  ;; garbage collection
  (setq gc-cons-threshold 1000000)
  ;; 1mb: amout of data Emcas reads from the process
  (setq read-process-output-max (* 1024 1024)
		treemacs-space-between-root-nodes nil
		lsp-idle-delay 0.1  ;; clangd is fast
		)

  ;; remove headline
  (setq lsp-headerline-breadcrumb-enable nil)

  ;; remove modeline (use custom one defined in cust_modeline.el)
  (setq lsp-modeline-code-actions-enable nil)

  ;; remove sideline (warnings, ...)
  (setq lsp-ui-sideline-enable nil)
  
  (with-eval-after-load 'lsp-mode
	(add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
	(require 'dap-cpptools)
	(yas-global-mode))
  )

;; optionally
(use-package lsp-ui
  :commands lsp-ui-mode)

;; if you are helm user
(use-package helm-lsp
  :commands
  helm-lsp-workspace-symbol)

(use-package lsp-treemacs
  :commands
  lsp-treemacs-errors-list)

;; optionally if you want to use debugger
(use-package dap-mode)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

;; optional if you want which-key integration
(use-package which-key
    :config
    (which-key-mode))

(provide 'cust_cpp)
;;; cust_cpp ends here