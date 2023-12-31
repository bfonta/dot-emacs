;;; my_buffers --- Summary
;;; Code:
;;; Commentary:

;;;###autoload
(defun compilation-find-file (marker filename directory &rest formats)
  "Overrides same name function from compile.el to fix grep buffer display."
  (or formats (setq formats '("%s")))
  (let ((dirs compilation-search-path)
        (spec-dir (if directory
                      (expand-file-name directory)
                    default-directory))
        buffer thisdir fmts name)
    (if (file-name-absolute-p filename)
        ;; The file name is absolute.  Use its explicit directory as
        ;; the first in the search path, and strip it from FILENAME.
        (setq filename (abbreviate-file-name (expand-file-name filename))
              dirs (cons (file-name-directory filename) dirs)
              filename (file-name-nondirectory filename)))
    ;; Now search the path.
    (while (and dirs (null buffer))
      (setq thisdir (or (car dirs) spec-dir)
            fmts formats)
      ;; For each directory, try each format string.
      (while (and fmts (null buffer))
        (setq name (expand-file-name (format (car fmts) filename) thisdir)
              buffer (and (file-exists-p name)
                          (find-file-noselect name))
              fmts (cdr fmts)))
      (setq dirs (cdr dirs)))
    (while (null buffer)    ;Repeat until the user selects an existing file.
      ;; The file doesn't exist.  Ask the user where to find it.
      (save-excursion            ;This save-excursion is probably not right.
        (let ((w (let ((pop-up-windows t))
		   (display-buffer
		    (marker-buffer marker)
		    '(display-buffer-same-window
		      (allow-no-window . nil) (inhibit-same-window . nil))))))
          (with-current-buffer (marker-buffer marker)
	    (goto-char marker)
	    (and w (compilation-set-window w marker)))
          (let* ((name (read-file-name
                        (format "Find this %s in (default %s): "
                                compilation-error filename)
                        spec-dir filename t nil
                        ;; The predicate below is fine when called from
                        ;; minibuffer-complete-and-exit, but it's too
                        ;; restrictive otherwise, since it also prevents the
                        ;; user from completing "fo" to "foo/" when she
                        ;; wants to enter "foo/bar".
                        ;;
                        ;; Try to make sure the user can only select
                        ;; a valid answer.  This predicate may be ignored,
                        ;; tho, so we still have to double-check afterwards.
                        ;; TODO: We should probably fix read-file-name so
                        ;; that it never ignores this predicate, even when
                        ;; using popup dialog boxes.
                        ;; (lambda (name)
                        ;;   (if (file-directory-p name)
                        ;;       (setq name (expand-file-name filename name)))
                        ;;   (file-exists-p name))
                        ))
                 (origname name))
            (cond
             ((not (file-exists-p name))
              (message "Cannot find file `%s'" name)
              (ding) (sit-for 2))
             ((and (file-directory-p name)
                   (not (file-exists-p
                         (setq name (expand-file-name filename name)))))
              (message "No `%s' in directory %s" filename origname)
              (ding) (sit-for 2))
             (t
              (setq buffer (find-file-noselect name))))))))
    ;; Make intangible overlays tangible.
    ;; This is weird: it's not even clear which is the current buffer,
    ;; so the code below can't be expected to DTRT here.  -- Stef
    (dolist (ov (overlays-in (point-min) (point-max)))
      (when (overlay-get ov 'intangible)
        (overlay-put ov 'intangible nil)))
    buffer))

;;;###autoload
(defun revert-buffers ()
  "Refresh all open file buffers without confirmation.
Buffers in modified (not yet saved) state in Emacs will not be reverted.
They will be reverted though if they were modified outside Emacs.
Buffers visiting files which do not exist any more or are no longer readable
will be killed."
  (interactive)
  (dolist (buf (buffer-list))
    (let ((filename (buffer-file-name buf)))
      ;; Revert only buffers containing files, which are not modified;
      ;; do not try to revert non-file buffers like *Messages*.
      (when (and filename
                 (not (buffer-modified-p buf)))
        (if (file-readable-p filename)
            ;; If the file exists and is readable, revert the buffer.
            (with-current-buffer buf
              (revert-buffer :ignore-auto :noconfirm :preserve-modes))
          ;; Otherwise, kill the buffer.
          (let (kill-buffer-query-functions) ; No query done when killing buffer
            (kill-buffer buf)
            (message "Killed non-existing/unreadable file buffer: %s" filename))))))
  (message "Finished reverting buffers containing unmodified files."))

;;;###autoload
(defun dts-switch-between-header-and-source ()
  "Switch between a c/c++ header (.h) and its corresponding source (.c/.cc)."
  (interactive)
  ;; grab the base of the current buffer's file name
  (setq bse (file-name-sans-extension buffer-file-name))
  ;; and the extension, converted to lowercase so we can
  ;; compare it to "h", "c", "cpp", etc
  (setq ext (downcase (file-name-extension buffer-file-name)))
  ;; This is like a c/c++ switch statement, except that the
  ;; conditions can be any true/false evaluated statement
  (cond
   ;; first condition - the extension is "h"
   ((equal ext "h")
    ;; first, look for bse.c 
    (setq nfn (replace-regexp-in-string "Code/interface/" "Code/src/" (concat bse ".c")))
    (if (file-exists-p nfn)
        ;; if it exists, either switch to an already-open
        ;;  buffer containing that file, or open it in a new buffer
	;; this is the "else" part - note that if it is more than
	;;  one line, it needs to be wrapped in a (progn )
	(progn
	  ;; look for a bse.cpp
	  (setq nfn (replace-regexp-in-string "Code/interface/" "Code/src/" (concat bse ".cc")))
	  ;; likewise 
	  (find-file nfn)
	  )
      )
    )
   ;; second condition - the extension is "c" or "cpp"
   ((or (equal ext "cc") (equal ext "c"))
    ;; look for a corresponding bse.h
    (setq nfn (replace-regexp-in-string "Code/src/" "Code/interface/" (concat bse ".h")))
    (find-file nfn)
    )
   )
  )

;;;###autoload
(defun switch-to-minibuffer-window ()
  "switch to minibuffer window (if active)"
  (interactive)
  (when (active-minibuffer-window)
    (select-frame-set-input-focus (window-frame (active-minibuffer-window)))
    (select-window (active-minibuffer-window))))

(use-package cl-lib
  :ensure t)
(defadvice save-buffers-kill-emacs (around no-query-kill-emacs activate)
  "Prevent annoying \"Active processes exist\" query when you quit Emacs."
  (cl-letf (((symbol-function #'process-list) (lambda ())))
    ad-do-it))

;;;###autoload
(defun my/buffer-name ()   
    "Copy the name of the current buffer to the kill ring."  
    (interactive)  
    (kill-new (file-name-nondirectory (buffer-file-name (window-buffer (minibuffer-selected-window))))))

;;;###autoload
(defun my/duplicate-buffer ()
  "Open the file that the current buffer is visiting in a new buffer."
  (interactive)
  (let* ((fn buffer-file-name)
         (buf (create-file-buffer fn)))
    (with-current-buffer buf
      (setq buffer-file-name fn)
      (revert-buffer t t))
    (switch-to-buffer-other-window buf)))

;;;###autoload
(defun my/kill-all-buffers ()
  (interactive)
  (mapcar 'kill-buffer (buffer-list))
  (delete-other-windows))

(provide 'my_buffers)
;;; my_buffers ends here
