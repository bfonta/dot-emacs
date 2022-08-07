;;; my_gitlink --- Summary
;;; Code:
;;; Commentary:

(use-package git-link
  :defer t
  :custom
  (git-link-use-commit t)
  (git-link-open-in-browser t)
  (git-link-use-single-line-number t))

(provide 'my_gitlink)
;;; my_gitlink ends here
