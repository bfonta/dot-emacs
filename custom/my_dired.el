;;; my_dired --- Summary
;;; Code:
;;; Commentary:

(use-package dired-subtree)
(use-package dired-collapse) ; colapses folder display with one file only

(use-package dired
  :ensure nil ; any non-package.el package needs this flag
  :init
  (require 'dired-x)
  :config

  (global-set-key (kbd "C-x f") 'dired-jump)
  (define-key dired-mode-map [?%?h] 'my/dired-show-only)
  (define-key dired-mode-map [?%?s] 'my/dired-swap-omit)
  (define-key dired-mode-map (kbd "C-<up>") 'dired-up-directory)
  (define-key dired-mode-map (kbd "S-<return>") 'dired-find-file-other-window)
  (define-key dired-mode-map (kbd "q") 'dired-subtree-toggle)
  (setq dired-deletion-confirmer #'y-or-n-p ;; ls program name
		dired-listing-switches "-ltrhgo --time-style=long-iso"
		large-file-warning-threshold 500000000 ;; about 500 MB
		)
  (add-hook 'dired-mode-hook
			(lambda ()
              (dired-omit-mode 1)
			  (dired-collapse-mode 1)
			  ))
  )

;;;###autoload
(defun my/dired-swap-omit ()
  "Show/hide dot-files"
  (interactive)
  (when (equal major-mode 'dired-mode)
    (if (or (not (boundp 'dired-dotfiles-show-p)) dired-dotfiles-show-p) ; if currently showing
		(progn 
	      (set (make-local-variable 'dired-dotfiles-show-p) nil)
	      (message "h")
	      (dired-mark-files-regexp "^\\\.")
	      (dired-do-kill-lines))
	  (progn (revert-buffer) ; otherwise just revert to re-show
			 (set (make-local-variable 'dired-dotfiles-show-p) t)))))


;; alternated color stripes in dired
(add-to-list 'load-path "~/dot-emacs/stripes/")
(load-library "stripes")
(setq stripes-unit 1)
(modify-face 'stripes "#bebebe" "#3F3F3F")
(add-hook 'dired-mode-hook
		  (lambda () (stripes-mode 1)))
		  
(use-package dired-rainbow
    :config
    (dired-rainbow-define-chmod directory "#6cb2eb" "d.*")
    (dired-rainbow-define html "#eb5286" ("css" "less" "sass" "scss" "htm" "html" "jhtm" "mht" "eml" "mustache" "xhtml"))
    (dired-rainbow-define xml "#f2d024" ("xml" "xsd" "xsl" "xslt" "wsdl" "bib" "json" "msg" "pgn" "rss" "yaml" "yml" "rdata"))
    (dired-rainbow-define document "#9561e2" ("docm" "doc" "docx" "odb" "odt" "pdb" "pdf" "ps" "rtf" "djvu" "epub" "odp" "ppt" "pptx"))
    (dired-rainbow-define markdown "#ffed4a" ("org" "etx" "info" "markdown" "md" "mkd" "nfo" "pod" "rst" "tex" "textfile" "txt"))
    (dired-rainbow-define database "#6574cd" ("xlsx" "xls" "csv" "accdb" "db" "mdb" "sqlite" "nc"))
    (dired-rainbow-define media "#de751f" ("mp3" "mp4" "mkv" "MP3" "MP4" "avi" "mpeg" "mpg" "flv" "ogg" "mov" "mid" "midi" "wav" "aiff" "flac"))
    (dired-rainbow-define image "#f66d9b" ("tiff" "tif" "cdr" "gif" "ico" "jpeg" "jpg" "png" "psd" "eps" "svg"))
    (dired-rainbow-define log "#c17d11" ("log"))
    (dired-rainbow-define shell "#f6993f" ("awk" "bash" "bat" "sed" "sh" "zsh" "vim"))
    (dired-rainbow-define interpreted "#38c172" ("py" "ipynb" "rb" "pl" "t" "msql" "mysql" "pgsql" "sql" "r" "clj" "cljs" "scala" "js"))
    (dired-rainbow-define compiled "#4dc0b5" ("asm" "cl" "lisp" "el" "c" "h" "c++" "h++" "hpp" "hxx" "m" "cc" "cs" "cp" "cpp" "go" "f" "for" "ftn" "f90" "f95" "f03" "f08" "s" "rs" "hi" "hs" "pyc" ".java"))
    (dired-rainbow-define executable "#8cc4ff" ("exe" "msi"))
    (dired-rainbow-define compressed "#51d88a" ("7z" "zip" "bz2" "tgz" "txz" "gz" "xz" "z" "Z" "jar" "war" "ear" "rar" "sar" "xpi" "apk" "xz" "tar"))
    (dired-rainbow-define packaged "#faad63" ("deb" "rpm" "apk" "jad" "jar" "cab" "pak" "pk3" "vdf" "vpk" "bsp"))
    (dired-rainbow-define encrypted "#ffed4a" ("gpg" "pgp" "asc" "bfe" "enc" "signature" "sig" "p12" "pem"))
    (dired-rainbow-define fonts "#6cb2eb" ("afm" "fon" "fnt" "pfb" "pfm" "ttf" "otf"))
    (dired-rainbow-define partition "#e3342f" ("dmg" "iso" "bin" "nrg" "qcow" "toast" "vcd" "vmdk" "bak"))
    (dired-rainbow-define vc "#0074d9" ("git" "gitignore" "gitattributes" "gitmodules"))
    (dired-rainbow-define-chmod executable-unix "#38c172" "-.*x.*"))

;;;###autoload
(defun mydired-sort ()
  "Sort dired listings with directories first (https://www.emacswiki.org/emacs/DiredSortDirectoriesFirst)."
  (save-excursion
    (let (buffer-read-only)
      (forward-line 2) ;; beyond dir. header 
      (sort-regexp-fields t "^.*$" "[ ]*." (point) (point-max)))
    (set-buffer-modified-p nil)))
(defadvice dired-readin
  (after dired-after-updating-hook first () activate)
  "Sort dired listings with directories first before adding marks."
  (mydired-sort))

;;;###autoload
(defun my/dired-show-only (regexp)
  "Type `y` or `n` without requiring additional `Enter` key press. Note that recursive directory deletion hard-codes a yes-or-no-p because it's a more dangerous action."
  (interactive "sFiles to show (regexp): ") 
  (dired-mark-files-regexp regexp) ;; dired %m command
  (dired-toggle-marks) ;; dired *t command
  (dired-do-kill-lines) ;; dired k command
  )

;;press enter only once to enter folder/file after isearch
(add-hook 'isearch-mode-end-hook 
  (lambda ()
    (when (and (eq major-mode 'dired-mode)
			   (not isearch-mode-end-hook-quit)
			   (eq last-input-event 'return)
			   )
      (dired-find-file))))

(use-package dired-sidebar
  :defer t
  :commands (dired-sidebar-toggle-sidebar))

;;;###autoload
(defun my/dired-duplicate-this-file (suffix)
  "Duplicate file on this line."
  (interactive (list (read-string "Suffix: " "_COPY")))
  (dired-do-copy-regexp "\\(.*\\)\\.\\(.*\\)"
						(concat "\\1" suffix ".\\2"))
  )

;;;###autoload
(defun my/dired-open-root-cern-file ()
  (interactive)
  (setq dfn (dired-get-filename))

  (if (get-buffer "*shell_ROOT*")
	  (shell (concat "*shell_ROOT_" (read-string "New shell for ROOT CERN prompt: shell_ROOT_") "*"))
	(shell "*shell_ROOT*"))

  (insert (concat "root " dfn))
  (comint-send-input)

  (insert "new TBrowser")
  (comint-send-input)
  )
(define-key dired-mode-map (kbd "b") #'my/dired-open-root-cern-file)

(setq image-dired-external-viewer "/usr/bin/okular")

(provide 'my_dired)
;;; my_dired ends here
