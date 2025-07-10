;;; -*- lexical-binding: nil; -*-

;;; cust_desktop --- Summary
;;; Code:
;;; Commentary:

(save-place-mode 1)

;;The following defvar's avoid lisp warnings
(defvar desktop-dirname)
(defvar desktop-base-file-name)
(defvar desktop-base-lock-name)
(defvar desktop-path)
(defvar desktop-save)
(defvar desktop-files-not-to-save)
(defvar desktop-load-locked-desktop)
(defvar desktop-auto-save-timeout)

(setq desktop-dirname             "~/dot-emacs/desktop/"
      desktop-base-file-name      "emacs.desktop"
      desktop-base-lock-name      "lock"
      desktop-path                (list desktop-dirname)
      desktop-save                t
      desktop-files-not-to-save   "^$" ;reload tramp paths
      desktop-load-locked-desktop nil
      desktop-auto-save-timeout   30)
(desktop-save-mode 0)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Modify desktop-change-dir from desktop.el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(eval-after-load "desktop"
  '(progn

	 (defvar choose-directory-desktops-directory "~/dot-emacs/desktops/"
	   "Initial default directory.")

	 ;;;###autoload
	 (defun desktop-change-dir-my-copy (dirname)
	   "Copy of desktop-change-dir function in desktop.el."
	   (interactive "DChange to directory: ")
	   (setq dirname (file-name-as-directory (expand-file-name dirname desktop-dirname)))
	   (desktop-kill)
	   (desktop-clear)
	   (desktop-read dirname))

	 ;;;###autoload
	 (defun desktop-change-dir ()
	   "Modify the default directory appearing with the D control letter."
	   (interactive)
	   (let ((default-directory choose-directory-desktops-directory))
		 (call-interactively 'desktop-change-dir-my-copy)))
	 )
  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Modify desktop-save from desktop.el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(eval-after-load "desktop"
  '(progn

	 (defvar choose-directory-desktops-directorys "~/dot-emacs/desktops/"
	   "Initial default directory.")

	 ;;;###autoload
	 (defun desktop-save-my-copy (dirname &optional release only-if-changed version)
	   "Copy of desktop-save function in desktop.el."
	   (interactive (list
					 ;; Or should we just use (car desktop-path)?
					 (let ((default (if (member "." desktop-path)
							    default-directory
							  user-emacs-directory)))
					   (read-directory-name "Directory to save desktop file in: "
											default default t))
					 nil
					 nil
					 current-prefix-arg))
	   (setq desktop-dirname (file-name-as-directory (expand-file-name dirname)))
	   (save-excursion
		 (let ((eager desktop-restore-eager)
			   (new-modtime (file-attribute-modification-time
							 (file-attributes (desktop-full-file-name)))))
		   (when
			   (or (not new-modtime)		; nothing to overwrite
				   (equal desktop-file-modtime new-modtime)
				   (yes-or-no-p (if desktop-file-modtime
									(if (time-less-p desktop-file-modtime
													 new-modtime)
										"Desktop file is more recent than the one loaded.  Save anyway? "
									  "Desktop file isn't the one loaded.  Overwrite it? ")
								  "Current desktop was not loaded from a file.  Overwrite this desktop file? "))
				   (unless release (error "Desktop file conflict")))

			 ;; If we're done with it, release the lock.
			 ;; Otherwise, claim it if it's unclaimed or if we created it.
			 (if release
				 (desktop-release-lock)
			   (unless (and new-modtime (desktop-owner)) (desktop-claim-lock)))

			 ;; What format are we going to write the file in?
			 (setq desktop-io-file-version
				   (cond
					((equal version '(4))
					 (if (or (eq desktop-io-file-version 208)
							 (yes-or-no-p "Save desktop file in format 208 \
\(Readable by Emacs 25.1 and later only)? "))
						 208
					   (or desktop-io-file-version desktop-native-file-version)))
					((equal version '(16))
					 (if (or (eq desktop-io-file-version 206)
							 (yes-or-no-p "Save desktop file in format 206 \
\(Readable by all Emacs versions since 22.1)? "))
						 206
					   (or desktop-io-file-version desktop-native-file-version)))
					((memq version '(206 208))
					 version)
					((null desktop-io-file-version) ; As yet, no desktop file exists.
					 desktop-native-file-version)
					(t
					 desktop-io-file-version)))

			 (with-temp-buffer
			   (insert
				";; -*- mode: emacs-lisp; lexical-binding:t; coding: utf-8-emacs; -*-\n"
				desktop-header
				";; Created " (current-time-string) "\n"
				";; Desktop file format version " (format "%d" desktop-io-file-version) "\n"
				";; Emacs version " emacs-version "\n")
			   (save-excursion (run-hooks 'desktop-save-hook))
			   (goto-char (point-max))
			   (insert "\n;; Global section:\n")
			   ;; Called here because we save the window/frame state as a global
			   ;; variable for compatibility with previous Emacsen.
			   (desktop-save-frameset)
			   (unless (memq 'desktop-saved-frameset desktop-globals-to-save)
				 (desktop-outvar 'desktop-saved-frameset))
			   (mapc #'desktop-outvar desktop-globals-to-save)
			   (setq desktop-saved-frameset nil) ; after saving desktop-globals-to-save
			   (when (memq 'kill-ring desktop-globals-to-save)
				 (insert
				  "(setq kill-ring-yank-pointer (nthcdr "
				  (int-to-string (- (length kill-ring) (length kill-ring-yank-pointer)))
				  " kill-ring))\n"))

			   (insert "\n;; Buffer section -- buffers listed in same order as in buffer list:\n")
			   (dolist (l (mapcar #'desktop-buffer-info (buffer-list)))
				 (let ((base (pop l)))
				   (when (apply #'desktop-save-buffer-p l)
					 (insert "("
							 (if (or (not (integerp eager))
									 (if (zerop eager)
										 nil
									   (setq eager (1- eager))))
								 "desktop-create-buffer"
							   "desktop-append-buffer-args")
							 " "
							 (format "%d" desktop-io-file-version))
					 ;; If there's a non-empty base name, we save it instead of the buffer name
					 (when (and base (not (string= base "")))
					   (setcar (nthcdr 1 l) base))
					 (dolist (e l)
					   (insert "\n  " (desktop-value-to-string e)))
					 (insert ")\n\n"))))

			   (setq default-directory desktop-dirname)
			   ;; When auto-saving, avoid writing if nothing has changed since the last write.
			   (let* ((beg (and only-if-changed
								(save-excursion
								  (goto-char (point-min))
								  ;; Don't check the header with changing timestamp
								  (and (search-forward "Global section" nil t)
									   ;; Also skip the timestamp in desktop-saved-frameset
									   ;; if it's saved in the first non-header line
									   (search-forward "desktop-saved-frameset"
													   (line-beginning-position 3) t)
									   ;; This is saved after the timestamp
									   (search-forward (format "%S" desktop--app-id) nil t))
								  (point))))
					  (checksum (and beg (md5 (current-buffer) beg (point-max) 'utf-8-emacs))))
				 (unless (and checksum (equal checksum desktop-file-checksum))
				   (let ((coding-system-for-write 'utf-8-emacs))
					 (write-region (point-min) (point-max) (desktop-full-file-name) nil 'nomessage))
				   (setq desktop-file-checksum checksum)
				   ;; We remember when it was modified (which is presumably just now).
				   (setq desktop-file-modtime (file-attribute-modification-time
											   (file-attributes
												(desktop-full-file-name)))))))))))
	 

     	 ;;;###autoload
	 	 (defun desktop-save ()
		   "Modify the default directory appearing with the D control letter."
		   (interactive)
		   (let (
			 (default-directory choose-directory-desktops-directory)
			 (user-emacs-directory choose-directory-desktops-directory))
			 (call-interactively 'desktop-save-my-copy)))
		 )
  )

(provide 'cust_desktop)
;;; cust_desktop ends here
