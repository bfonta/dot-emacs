;;; my_open --- Summary
;;; Code:
;;; Commentary: https://stackoverflow.com/questions/11218316/emacs-dired-and-openwith

(use-package openwith
  :init
  (openwith-mode 1)
  
  :config
  (setq openwith-associations
        (list
         (list (openwith-make-extension-regexp
                '("mpg" "mpeg" "mp3" "mp4"
                  "avi" "wmv" "wav" "mov" "flv"
                  "ogm" "ogg" "mkv"))
               "mpv"
               '(file))
         (list (openwith-make-extension-regexp
                '("png" "gif" "jpeg"))
               "okular"
               '(file))
		 (list (openwith-make-extension-regexp
                '("svg"))
               "eog"
               '(file))
         (list (openwith-make-extension-regexp
                '("pdf"))
               "okular"
               '(file)))))

(provide 'my_open)
;;; my_open ends here

