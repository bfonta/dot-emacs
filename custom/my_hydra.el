;;; my_hydra --- Summary
;;; Code:
;;; Commentary: https://github.com/abo-abo/hydra/wiki/Nesting-Hydras

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
  (delete-other-windows)
  (find-file "~/Documents/LatexArchive/CurriculumVitae/Curriculum/master.tex")
  )

(use-package hydra
  )

(defhydra hydra-dired (:exit t)
  "Quick navigation."
  ("e" (dired "~/dot-emacs/custom/")       "emacs")
  ("b" (dired "~/dot-emacs/bibliography/") "biblio")
  ("o" (dired "~/org/")                    "org")
  ("d" (dired "~/Documents/")              "docs")
  ("w" (dired "~/Downloads/")              "downloads")
  ("p" (dired "~/Pictures/")               "pics")
  ("s" (dired "~/Pictures/Screenshots/")   "screenshots")
  ("t" (my/hydra-set-thesis)               "thesis")
  ("x" (my/hydra-set-dis-proceedings)      "DIS")
  ("c" (my/hydra-set-cv)                   "cv")

  ("1" (dired "~/remote1/")  "Rem1")
  ("2" (dired "~/remote2/")  "Rem2")
  ("3" (dired "~/remote3/")  "Rem3")
  ("4" (dired "~/remote4/")  "Rem4")
  ("5" (dired "~/remote5/")  "Rem5")
  )

(defhydra hydra-pdf (:exit t)
  "Quick navigation."
  ("t" (find-file "~/Downloads/Books/latex_math.pdf")     "tex symbols")
  ("c" (find-file "~/Downloads/Books/CadamuroThesis.pdf") "Cadamuro Thesis")
  ("a" (find-file "~/Downloads/Books/AlessandroTesi.pdf") "Alessandro Thesis")
  ("j" (find-file "~/Downloads/Books/JonaTesi.pdf")       "Jona Thesis")
  ("m" (find-file "~/Downloads/Books/Thomson.pdf")        "Modern Particle Physics")
  )

(global-set-key (kbd "C-x d") 'hydra-dired/body)
(global-set-key (kbd "C-x p") 'hydra-pdf/body)

(provide 'my_hydra)
;;; my_hydra ends here
