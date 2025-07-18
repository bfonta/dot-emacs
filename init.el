;;; -*- lexical-binding: nil; -*-

;;; ---------------------------
;;; Sets $MANPATH, $PATH and exec-path from your shell, but only when executed in a GUI frame on OS X and Linux.
;;; https://github.com/purcell/exec-path-from-shell
;;; ---------------------------
(use-package exec-path-from-shell
  :ensure t
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize))
  )

(setq native-comp-async-report-warnings-errors nil) ;; prevents annoying pop-up warning buffer to appear

;;; Emacs performance (plists vs slower hash-table)
(setenv "LSP_USE_PLISTS" "true")

;;; Require quelpa
(use-package quelpa
  :ensure)
(use-package quelpa-use-package
  :demand
  :config
  (quelpa-use-package-activate-advice))

(setq font-latex-match-italic-command-keywords
	  '(("paragraph" "{")))

;;; ---------------------------
;;; Load custom content
;;; ---------------------------
(add-to-list 'load-path "~/dot-emacs/custom/")
(load-library "my_benchmarkinit")
(load-library "my_emacsclient")
(load-library "my_theme")
(load-library "my_startup")
(load-library "my_frame")
(load-library "my_menu")
(load-library "my_windows")
(load-library "my_definitions")
(load-library "my_cua")
(load-library "my_whichfunc")
(load-library "my_buffers")
(load-library "my_search")
(load-library "my_dired")
(load-library "my_snippets")
(load-library "my_projectile")
(load-library "my_cern_ldap")

;; cscope (a better alternative to etags)
(add-to-list 'load-path "~/dot-emacs/xcscope/")
(load-library "xcscope")
(require 'xcscope)
(cscope-setup)

(load-library "my_helm")

(add-to-list 'load-path "~/dot-emacs/wttrin/")
(load-library "wttrin")
(load-library "my_weather")

;; (add-to-list 'load-path "~/dot-emacs/helm-ag/")
;; (load-library "helm-ag")

(load-library "my_disk")
(load-library "my_replace")
(load-library "my_org")
(load-library "my_markdown")
(load-library "my_open")
(load-library "my_company")
(load-library "my_lisp")
(load-library "my_diff")
(load-library "my_smerge")
(load-library "my_compilation")
(load-library "my_modeline")
(load-library "my_pdf")
(load-library "my_csv")
(load-library "my_tex")
(load-library "my_text")
(load-library "my_python")
(load-library "my_yaml")
(load-library "my_golang")
(load-library "my_gitlink")
(load-library "my_pulsar")
(load-library "my_connection")
(load-library "my_desktop")
(load-library "my_scroll")
(load-library "my_shell")
(load-library "my_pastebuffer")
(load-library "my_cursor")
(load-library "my_emojis")
(load-library "my_shackle")
(load-library "my_expandregion")
;; (load-library "my_magit")
;; (load-library "my_copilot")   
;; (load-library "my_multiplecursors")
;; (load-library "my_mail")
(load-library "my_hydra")
(load-library "my_biblio")			
(load-library "my_colors")
(load-library "my_commands")
(load-library "my_vundo")
(load-library "my_gpt")
(load-library "my_scratch")
(load-library "my_thesis")

(add-to-list 'load-path "~/dot-emacs/markerpen/")
(load-library "markerpen")

(add-to-list 'load-path "~/dot-emacs/transpose_frame/")
(require 'transpose-frame)

(add-to-list 'load-path "~/dot-emacs/ox-extra/")
(require 'ox-extra)
;; activate the :ignore: tag
;; excludes the heading upon tex/pdf export while still including its contents.
;; (ox-extras-activate '(latex-header-blocks ignore-headlines))
(ox-extras-activate '(ignore-headlines))

(add-to-list 'load-path "~/dot-emacs/zoom/") ;; using deprecated 'cl' package
(require 'zoom-frm)

(add-to-list 'load-path "~/dot-emacs/grep-a-lot/")
(require 'grep-a-lot)
(load-library "my_grep")

;; ;; The default is 800 kilobytes.  Measured in bytes.
;; (setq gc-cons-threshold (* 50 1000 1000))
;; ;; Silence compiler warnings as they can be pretty disruptive
;; (setq native-comp-async-report-warnings-errors nil)
;; ;; Set the right directory to store the native comp cache
;; (add-to-list 'native-comp-eln-load-path (expand-file-name "eln-cache/" user-emacs-directory))

(load-library "my_keybinds") ;; should be the last one to be loaded

(defun my/load-emacs ()
  """Quick emacs configuration loading."""
  (interactive)
  (load user-init-file)
  )

;;; init.el ends here
