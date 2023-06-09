;;; my_modeline --- Summary
;;; Code:
;;; Commentary:

(defface my-vc-branch-face
  '((t (:foreground "red")))
  "Read-only buffer highlighting."
  :group 'faces)

;; use setq-default to set it for /all/ modes
;; use setq to set it for single modes
(setq-default mode-line-format
              (list

               " "

               '(:eval (list
                        ;; the buffer name; the file name as a tool tip
                        (propertize "%b" 'face 'font-lock-type-face
                                    'help-echo (buffer-file-name))
                        (when (buffer-modified-p)
                          (propertize
                           ""
                           'face (if (cogent-line-selected-window-active-p)
                                     'cogent-line-modified-face
                                   'cogent-line-modified-face-inactive)))
                        (when buffer-read-only
                          (propertize
                           "["
                           'face (if (cogent-line-selected-window-active-p)
                                     'cogent-line-read-only-face
                                   'cogent-line-read-only-face-inactive)))
                        " "))
			   
	       	   ;; version control information
			   '(:eval (when-let (vc-mode vc-mode)
                         (list ""
                               (propertize (concat "(⚑ " (substring vc 5) ") ")
                                           'face
	    								   'my-vc-branch-face
	    								   )
                               "")))

               ;; relative position in file
			   ;; '(:eval (list (nyan-create))) ;; from the nyan-mode package
               (propertize "%p " 'face 'font-lock-constant-face)

	       ;; "%m "
	       ;; line (and possibly column) number
               ;(propertize "%l:%c" 'face 'font-lock-constant-face)

	       " "
	       mode-line-misc-info ; for eyebrowse
	       
	       ;; is this buffer read-only?
	       '(:eval (when buffer-read-only
	    	 (propertize "RO"
	    				 'face 'font-lock-type-face
	    				 'help-echo "Buffer is read-only")))
	       
               ;; spaces to align right
               '(:eval (propertize
                        " " 'display
                        `((space :align-to (- (+ right right-fringe right-margin)
                                              ,(+ 3 (string-width mode-name)))))))
	       
               ;; the current major mode
               (propertize " %m " 'face 'font-lock-string-face)))

;;Colorize background compilation status output
(defun last-latex-compilation-status-update (arg)
  "Update the string that holds the status of the last latex compilation"
  (setq last-latex-compilation-status
	(save-excursion
	  (set-buffer "*Messages*")
	  (goto-char (point-max))   
	  (if (search-backward-regexp "^LaTeX\\(.*\\)$" nil t nil)
	      (let ((compilationstatus (match-string 1)))
		(cond
		 ((string-match "successfully" compilationstatus) (propertize "Success" 'font-lock-face '(:background "#006400")))
		 ((string-match "errors" compilationstatus) (propertize "Error" 'font-lock-face '(:foreground "red")))
		 ((string-match "unresolved" compilationstatus) (propertize "Unresolved" 'font-lock-face '(:foreground "blue")))
		 (t "No Compilation")))))))
(setq last-latex-compilation-status "No Compilation") 
(setq-default mode-line-format (append mode-line-format '((:eval (last-latex-compilation-status-update nil)))))

;;; Emacs 28.1: compactify mode line if it is longer than buffer width
(setq mode-line-compact 'long)

;;; Remove very slow VC (opening takes ~6 seconds) from org files
;; (add-hook 'emacs-lisp-mode-hook
;;           (lambda ()
;;             (face-remap-add-relative
;;              'mode-line '((:foreground "ivory" :background "DarkOrange2") mode-line))))

;; (defun add-mode-line-vc()
;;   "Set `mode-line-position' buffer-locally to nil."
;;   (setq-local mode-line-position nil))
;; (add-hook 'my-mode-hook #'remove-mode-line-position) ;; Usage example.

(provide 'my_modeline)
;;; my_modeline ends here
