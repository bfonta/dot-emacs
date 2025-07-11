;;; -*- lexical-binding: nil; -*-

;;; Remove startup "Warning (bytecomp): reference to free variable"
(defvar php-defs-functions-alist)
(defvar php-ide-lsp-command-alist)
(defvar php-project-available-root-files)
(defvar magit-view-git-manual-method)
(defvar lsp-auto-configure)
(defvar lsp-completion-enable)
(defvar php-project--validate-php-file-as-template)
(defvar php-project--eval-bootstrap-scripts)

;;; use-package: finds all installed packages and activates them by executing their <pkg>-autoloads.el files
;;; reference: https://ianyepan.github.io/posts/setting-up-use-package/
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'package)
(setq package-archives '(("gnu"    . "https://elpa.gnu.org/packages/")
						 ("nongnu" . "https://elpa.nongnu.org/nongnu/")
						 )
      package-quickstart t)
(add-to-list 'package-archives 
  '("melpa" . "https://melpa.org/packages/") t)
(eval-and-compile
  (setq use-package-always-ensure t
        use-package-expand-minimally t))
