;;; use-package: finds all installed packages and activates them by executing their <pkg>-autoloads.el files
;;; reference: https://ianyepan.github.io/posts/setting-up-use-package/
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'package)
;(add-to-list 'package-archives '("gnu"   . "https://elpa.gnu.org/packages/"))
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
						 )
      package-quickstart t)
(eval-and-compile
  (setq use-package-always-ensure t
        use-package-expand-minimally t))