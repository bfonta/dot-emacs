;;; my_open --- Summary
;;; Code:
;;; Commentary:

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
                '("xbm" "pbm" "pgm" "ppm" "pnm"
                  "png" "gif" "bmp" "tif" "jpeg")) ;; Removed jpg because Telega was
                  "okular"
                  '(file))
          (list (openwith-make-extension-regexp
                '("pdf"))
                "okular"
                '(file)))))

(provide 'my_open)
;;; my_open ends here

