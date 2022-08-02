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

;;; Emacs performance (plists vs slower hash-table)
(setenv "LSP_USE_PLISTS" "true")

;;; Required when compiled version 28.1 from source
(use-package popup
  :ensure t
  )

;; using deprecated 'cl' package
(add-to-list 'load-path "~/.emacs.d/zoom/")
(require 'zoom-frm)

;;; ---------------------------
;;; Load custom content
;;; ---------------------------
(add-to-list 'load-path "~/bash_definitions/.emacs.d/custom/")
(load-library "cust_definitions")
(load-library "cust_company")
(load-library "cust_cpp")
(load-library "cust_emacsclient")
(load-library "cust_dired")
(load-library "cust_menu")
(load-library "cust_magit")
(load-library "cust_lisp")
(load-library "cust_shackle")
(load-library "cust_compilation")
(load-library "cust_markdown")
(load-library "cust_python")
(load-library "cust_modeline")
(load-library "cust_whichfunc")
(load-library "cust_frametitle")
(load-library "cust_pdf")
(load-library "cust_gitlink")
(load-library "cust_tex")
(load-library "cust_replace")
(load-library "cust_buffers")
(load-library "cust_windows")
(load-library "cust_connection")
(load-library "cust_helm")
(load-library "cust_snippets")
(load-library "cust_desktop")
(load-library "cust_colors")
(load-library "cust_scroll")
(load-library "cust_shell")
(load-library "cust_expandregion")
(load-library "cust_pastebuffer")
(load-library "cust_org")
(load-library "cust_cursor")
(load-library "cust_emojis")
(load-library "cust_magit")
(load-library "cust_multiplecursors")
(load-library "cust_ebib")
;; ;; (load-library "cust_witheditor")
(load-library "cust_keybinds") ;;;; should be the last one to be loaded

;;; ---------------------------
;;; Load non-MELPA packages
;;; ---------------------------
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(add-to-list 'load-path "~/.emacs.d/markerpen/")
(load-library "markerpen")

;;; Indentation in python
;;; References: https://github.com/antonj/Highlight-Indentation-for-Emacs/blob/master/highlight-indentation.el
;;;             https://github.com/antonj/Highlight-Indentation-for-Emacs/issues/16
(add-to-list 'load-path "~/bash_definitions/.emacs.d/highlight-indentation/")
(load-library "highlight-indentation")
(set-face-attribute 'highlight-indentation-face nil
                    :stipple (list 8 4 (string 16 16 16 16))
                    :inherit nil
					:foreground "peru")
(setq highlight-indentation-blank-lines t)

;;; --------------------------------
;;; Load content added by customize
;;; --------------------------------
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;;; Temporary miscellaneous
(setq-default tab-width 4)

(defun load-emacs ()
  """Quick emacs configuration loading."""
  (interactive)
  ;; (load-file
  ;;  (concat (file-name-as-directory (getenv "HOME")) ".emacs")
  ;;  )
  (load user-init-file)
  )

;;; init.el ends here
