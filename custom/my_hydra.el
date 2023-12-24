;;; my_hydra --- Summary
;;; Code:
;;; Commentary:

(use-package hydra
  )

(defhydra hydra-dired (:exit t)
  "dired"
  ("e" (dired "~/dot-emacs/custom/")       "emacs")
  ("b" (dired "~/dot-emacs/bibliography/") "biblio")
  ("o" (dired "~/org/")                    "org")
  ("d" (dired "~/Documents/")              "docs")
  ("w" (dired "~/Downloads/")              "downloads")
  ("p" (dired "~/Pictures/")               "pics")
  ("s" (dired "~/Pictures/Screenshots/")   "screenshots")

  ("1" (dired "~/lxplus/")  "Lxplus")
  ("2" (dired "~/llr/")     "LLR")
  )

(global-set-key (kbd "C-x d") 'hydra-dired/body)

(provide 'my_hydra)
;;; my_hydra ends here
