;;; my_desktop.el --- Desktop/session setup and safer overrides -*- lexical-binding: t; -*-

(require 'desktop)
(require 'saveplace)

(save-place-mode 1)

;; Base desktop configuration
(setq desktop-dirname             (expand-file-name "~/dot-emacs/desktop/")
      desktop-base-file-name      "emacs.desktop"
      desktop-base-lock-name      "lock"
      desktop-path                (list desktop-dirname)
      desktop-save                t
      desktop-files-not-to-save   "^$"   ;; keep TRAMP buffers eligible if you want
      desktop-load-locked-desktop nil
      desktop-auto-save-timeout   30)

(desktop-save-mode 1)

(defgroup my-desktop nil
  "Custom desktop helpers."
  :group 'convenience)

(defcustom my/desktops-directory (expand-file-name "~/dot-emacs/desktops/")
  "Directory used as the default starting directory for desktop prompts."
  :type 'directory)

(defun my/desktop-change-dir (dirname)
  "Change to desktop in DIRNAME, prompting starting at `my/desktops-directory'."
  (interactive
   (list (read-directory-name "Change to directory: "
                             my/desktops-directory
                             my/desktops-directory
                             t)))
  (setq dirname (file-name-as-directory (expand-file-name dirname)))
  ;; Use the official API; don’t override `desktop-change-dir`.
  (desktop-kill)
  (desktop-clear)
  (desktop-read dirname))

(defun my/desktop-save (dirname &optional release)
  "Save desktop into DIRNAME, prompting starting at `my/desktops-directory'.

RELEASE is passed through to `desktop-save`."
  (interactive
   (list (read-directory-name "Directory to save desktop file in: "
                             my/desktops-directory
                             my/desktops-directory
                             t)
         current-prefix-arg))
  (setq dirname (file-name-as-directory (expand-file-name dirname)))
  ;; Call built-in `desktop-save` directly to avoid version-dependent arglists.
  (desktop-save dirname (not (null release))))

(provide 'my_desktop)
;;; my_desktop.el ends here
