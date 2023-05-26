;;; use-package: finds all installed packages and activates them by executing their <pkg>-autoloads.el files
;;; reference: https://ianyepan.github.io/posts/setting-up-use-package/
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'package)
(add-to-list 'package-archives '("gnu"   . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(eval-and-compile
  (setq use-package-always-ensure t
        use-package-expand-minimally t))

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

;;; ---------------------------
;;; Install `quelpa`
;;; https://github.com/quelpa/quelpa
;;; ---------------------------
;; (unless (package-installed-p 'quelpa)
;;   (with-temp-buffer
;;     (url-insert-file-contents "https://raw.githubusercontent.com/quelpa/quelpa/master/quelpa.el")
;;     (eval-buffer)
;;     (quelpa-self-upgrade)))

;;; ---------------------------
;;; Install utility to use `quelpa` with `use-package`
;;; https://github.com/quelpa/quelpa-use-package
;;; ---------------------------
;; (quelpa
;;  '(quelpa-use-package
;;    :fetcher git
;;    :url "https://github.com/quelpa/quelpa-use-package.git"))
;; (require 'quelpa-use-package)

;;; Emacs performance (plists vs slower hash-table)
(setenv "LSP_USE_PLISTS" "true")

;;; ---------------------------
;;; Load custom content
;;; ---------------------------
(add-to-list 'load-path "~/dot-emacs/custom/")
(load-library "my_theme")
(load-library "my_startup")
(load-library "my_frame")
(load-library "my_menu")
(load-library "my_definitions")
(load-library "my_open")
(load-library "my_cua")
(load-library "my_company")
;(load-library "my_companybox")
(load-library "my_cpp")
(load-library "my_emacsclient")
(load-library "my_magit")
(load-library "my_lisp")
(load-library "my_shackle")
(load-library "my_compilation")
(load-library "my_markdown")
(load-library "my_python")
(load-library "my_golang")
(load-library "my_whichfunc")
(load-library "my_modeline")
(load-library "my_pdf")
(load-library "my_gitlink")
(load-library "my_tex")
(load-library "my_replace")
(load-library "my_buffers")
(load-library "my_windows")
(load-library "my_pulsar")
(load-library "my_connection")
(load-library "my_helm")
(load-library "my_search")
(load-library "my_dired")
(load-library "my_snippets")
(load-library "my_desktop")
(load-library "my_colors")
(load-library "my_scroll")
(load-library "my_shell")
(load-library "my_expandregion")
(load-library "my_pastebuffer")
(load-library "my_org")
(load-library "my_cursor")
(load-library "my_emojis")
(load-library "my_magit")
;(load-library "my_copilot")
(load-library "my_multiplecursors")
(load-library "my_vundo")
(load-library "my_hydra")
(load-library "my_biblio")
(load-library "my_commands")
(load-library "my_keybinds") ;; should be the last one to be loaded

;;; ---------------------------
;;; Load non-MELPA packages
;;; ---------------------------
(add-to-list 'load-path "~/dot-emacs/markerpen/")
(load-library "markerpen")

(add-to-list 'load-path "~/dot-emacs/transpose_frame/")
(require 'transpose-frame)

(add-to-list 'load-path "~/dot-emacs/zoom/") ;; using deprecated 'cl' package
(require 'zoom-frm)

;; The default is 800 kilobytes.  Measured in bytes.
(setq gc-cons-threshold (* 50 1000 1000))
;; Silence compiler warnings as they can be pretty disruptive
(setq native-comp-async-report-warnings-errors nil)
;; Set the right directory to store the native comp cache
(add-to-list 'native-comp-eln-load-path (expand-file-name "eln-cache/" user-emacs-directory))

(defun my/load-emacs ()
  """Quick emacs configuration loading."""
  (interactive)
  (load user-init-file)
  )

;;; init.el ends here
