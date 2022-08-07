;;; cust_gitlink --- Summary
;;; Code:
;;; Commentary:

(use-package git-link
  :defer t
  :custom
  (git-link-use-commit t)
  (git-link-open-in-browser t)
  (git-link-use-single-line-number t))

(provide 'cust_gitlink)
;;; cust_gitlink ends here
