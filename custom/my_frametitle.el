;;; my_frametitle --- Summary
;;; Code:
;;; Commentary: http://emacs-fu.blogspot.com/2011/01/setting-frame-title.html

(setq frame-title-format
  '("" invocation-name ": "(:eval (if (buffer-file-name)
                (abbreviate-file-name (buffer-file-name))
                  "%b"))))

(provide 'my_frametitle)
;;; my_frametitle ends here
