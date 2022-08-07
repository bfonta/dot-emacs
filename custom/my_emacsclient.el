;;; my_emacsclient --- Summary
;;; Code:
;;; Commentary:

(load "server")
(unless (server-running-p) (server-start))

(provide 'my_emacsclient)
;;; my_emacsclient ends here
