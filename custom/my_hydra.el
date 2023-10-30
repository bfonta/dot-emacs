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

  ("1" (dired "~/lxplus_an/")           "AN")
  ("2" (dired "~/klub/")                "klub")
  ("3" (dired "~/big_ntuples/")         "big ntuples")
  ("4" (dired "~/llr_reco_hadro/")      "reco hadro")
  ("5" (dired "~/llr_fpgas/bye_splits") "fpgas")
  ("6" (dired "~/llr_met/")             "met")
  ("7" (dired "~/llr_clue3d/")          "clue3d")
  ("8" (dired "~/llr_finite/")          "finite")
  ("9" (dired "~/lxplus_klub/")         "lx_klub")
  ;; ("9" (dired "~/lxplus_b2g/")          "B2G")
  )

(global-set-key (kbd "C-x d") 'hydra-dired/body)

(provide 'my_hydra)
;;; my_hydra ends here
