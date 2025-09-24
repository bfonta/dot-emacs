;;; -*- lexical-binding: nil; -*-

;;; my_hydra --- Summary
;;; Code:
;;; Commentary: https://github.com/abo-abo/hydra/wiki/Nesting-Hydras

(use-package hydra
  :ensure t )

(defun my/hydra-set-thesis ()
  (interactive)
  (delete-other-windows)
  (find-file "~/org/PhD/Thesis/thesis.org")
  (split-window-right)
  (my/shrink-window-third)
  (windmove-right)
  (dired "~/org/PhD/Thesis/chapters/")
  )

(defun my/hydra-set-dis-proceedings ()
  (interactive)
  (delete-other-windows)
  (find-file "~/org/PhD/Thesis/dis_proceedings.org")
  (split-window-right)
  (my/shrink-window-third)
  (windmove-right)
  (dired "~/org/PhD/Thesis/dis_proceedings/")
)

(defun my/hydra-set-cv ()
  (interactive)
  ;; (delete-other-windows)

  )

(defhydra hydra-dired (:exit t)
  "Quick navigation."
  ("e" (dired "~/dot-emacs/custom/")       "emacs")
  ("b" (dired "~/dot-emacs/bibliography/") "biblio")
  ("o" (dired "~/org/")                    "org")
  ("n" (find-file "~/org/NGT/general.org") "NGT")
  ("d" (dired "~/Documents/")              "docs")
  ("w" (dired "~/Downloads/")              "downloads")
  ("p" (dired "~/Pictures/")               "pics")
  ("s" (dired "~/Pictures/Screenshots/")   "screenshots")
  ("t" (my/hydra-set-thesis)               "thesis")
  ("x" (my/hydra-set-dis-proceedings)      "DIS")
  ("c" (dired "~/cmssw/")        "CMSSW")

  ("1" (dired "~/remote1/")  "Rem1")
  ("2" (dired "~/remote2/")  "Rem2")
  ("3" (dired "~/remote3/")  "Rem3")
  ("4" (dired "~/remote4/")  "Rem4")
  ("5" (dired "~/remote5/")  "Rem5")
  )

(global-set-key (kbd "C-x d") 'hydra-dired/body)

(provide 'my_hydra)
;;; my_hydra ends here
