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

  ("1" (dired "~/remote1/")  "Rem1")
  ("2" (dired "~/remote2/")  "Rem2")
  ("3" (dired "~/remote3/")  "Rem3")
  ("4" (dired "~/remote4/")  "Rem4")
  ("5" (dired "~/remote5/")  "Rem5")
  )

(global-set-key (kbd "C-x d") 'hydra-dired/body)

(provide 'my_hydra)
;;; my_hydra ends here
