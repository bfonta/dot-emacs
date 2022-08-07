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
(add-to-list 'load-path "~/dot-emacs/zoom/")
(require 'zoom-frm)

;;; ---------------------------
;;; Load custom content
;;; ---------------------------
(add-to-list 'load-path "~/dot-emacs/custom/")
(load-library "my_definitions")
(load-library "my_vundo")
(load-library "my_company")
(load-library "my_cpp")
(load-library "my_emacsclient")
(load-library "my_dired")
(load-library "my_menu")
(load-library "my_magit")
(load-library "my_lisp")
(load-library "my_shackle")
(load-library "my_compilation")
(load-library "my_markdown")
(load-library "my_python")
(load-library "my_modeline")
(load-library "my_whichfunc")
(load-library "my_frametitle")
(load-library "my_pdf")
(load-library "my_gitlink")
(load-library "my_tex")
(load-library "my_replace")
(load-library "my_buffers")
(load-library "my_windows")
(load-library "my_connection")
(load-library "my_helm")
;;(load-library "my_avy")
(load-library "my_pulsar")
(load-library "my_snippets")
(load-library "my_perspective") ; (load-library "my_desktop")
(load-library "my_colors")
(load-library "my_scroll")
(load-library "my_shell")
(load-library "my_expandregion")
(load-library "my_pastebuffer")
(load-library "my_org")
(load-library "my_cursor")
(load-library "my_emojis")
(load-library "my_magit")
(load-library "my_multiplecursors")
;; ;; (load-library "witheditor")
(load-library "my_keybinds") ;;;; should be the last one to be loaded

;;; ---------------------------
;;; Load non-MELPA packages
;;; ---------------------------
(add-to-list 'custom-theme-load-path "~/dot-emacs/themes/")
(add-to-list 'load-path "~/dot-emacs/markerpen/")
(load-library "markerpen")

;;; Indentation in python
;;; References: https://github.com/antonj/Highlight-Indentation-for-Emacs/blob/master/highlight-indentation.el
;;;             https://github.com/antonj/Highlight-Indentation-for-Emacs/issues/16
(add-to-list 'load-path "~/dot-emacs/highlight-indentation/")
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
  (load user-init-file)
  )

;;; init.el ends here
