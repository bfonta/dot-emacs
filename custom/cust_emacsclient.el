;;; cust_emacsclient --- Summary
;;; Code:
;;; Commentary:

(load "server")
(unless (server-running-p) (server-start))

(provide 'cust_emacsclient)
;;; cust_emacsclient ends here
