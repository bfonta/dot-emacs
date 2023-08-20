;;; my_open --- Summary
;;; Code:
;;; Commentary: https://stackoverflow.com/questions/11218316/emacs-dired-and-openwith

;; (use-package openwith
;;   :init
;;   (openwith-mode 1)
  
;;   :config
;;   (setq openwith-associations
;;         (list
;;          (list (openwith-make-extension-regexp
;;                 '("mpg" "mpeg" "mp3" "mp4"
;;                   "avi" "wmv" "wav" "mov" "flv"
;;                   "ogm" "ogg" "mkv"))
;;                "mpv"
;;                '(file))
;;          (list (openwith-make-extension-regexp
;;                 '("png" "gif" "jpeg"))
;;                "okular"
;;                '(file))
;; 		 (list (openwith-make-extension-regexp
;;                 '("svg"))
;;                "eog"
;;                '(file))
;;          (list (openwith-make-extension-regexp
;;                 '("pdf"))
;;                "okular"
;;                '(file)))))

(defun my/open-in-external-app (&optional Fname)
  "Open the current file or dired marked files in external app.
When called in emacs lisp, if Fname is given, open that.

URL `http://xahlee.info/emacs/emacs/emacs_dired_open_file_in_ext_apps.html'
Version: 2019-11-04 2023-04-05 2023-06-26"
  (interactive)
  (let (xfileList xdoIt)
    (setq xfileList
          (if Fname
              (list Fname)
            (if (string-equal major-mode "dired-mode")
                (dired-get-marked-files)
              (list buffer-file-name))))
    (setq xdoIt (if (<= (length xfileList) 10) t (y-or-n-p "Open more than 10 files? ")))
    (when xdoIt
      (cond
       ((string-equal system-type "windows-nt")
        (let ((xoutBuf (get-buffer-create "*xah open in external app*"))
              (xcmdlist (list "PowerShell" "-Command" "Invoke-Item" "-LiteralPath")))
          (mapc
           (lambda (x)
             (message "%s" x)
             (apply 'start-process (append (list "xah open in external app" xoutBuf) xcmdlist (list (format "'%s'" (if (string-match "'" x) (replace-match "`'" t t x) x))) nil)))
           xfileList)
          ;; (switch-to-buffer-other-window xoutBuf)
          )
        ;; old code. calling shell. also have a bug if filename contain apostrophe
        ;; (mapc (lambda (xfpath) (shell-command (concat "PowerShell -Command \"Invoke-Item -LiteralPath\" " "'" (shell-quote-argument (expand-file-name xfpath)) "'"))) xfileList)
        )
       ((string-equal system-type "darwin")
        (mapc (lambda (xfpath) (shell-command (concat "open " (shell-quote-argument xfpath)))) xfileList))
       ((string-equal system-type "gnu/linux")
        (mapc (lambda (xfpath)
                (call-process shell-file-name nil 0 nil
                              shell-command-switch
                              (format "%s %s"
                                      "xdg-open"
                                      (shell-quote-argument xfpath))))
              xfileList))
       ((string-equal system-type "berkeley-unix")
        (mapc (lambda (xfpath) (let ((process-connection-type nil)) (start-process "" nil "xdg-open" xfpath))) xfileList))))))
(global-set-key (kbd "M-RET") 'my/open-in-external-app)

(provide 'my_open)
;;; my_open ends here

