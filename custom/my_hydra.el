;;; my_hydra --- Summary
;;; Code:
;;; Commentary:

(use-package hydra
  )

(defhydra hydra-dired (:exit t)
  "dired"
  ("t" (dired "~/llr_triggers") "triggers")
  ("e" (dired "~/dot-emacs/custom/") "emacs")
  ("b" (dired "~/dot-emacs/bibliography/") "biblio")
  ("o" (dired "~/org/") "org")
  ("d" (dired "~/Documents/") "docs")
  ("w" (dired "~/Downloads/") "downloads")
  ("p" (dired "~/Pictures/") "pics")
  ("s" (dired "~/Pictures/Screenshots/") "screenshots")

  ("1" (dired "~/llr_fpgas/bye_splits") "fpgas")
  ("2" (dired "~/klub/") "klub")
  ("3" (dired "~/an/") "an")
  ("4" (dired "~/big_ntuples/") "big ntuples")
  ("5" (dired "~/llr_reco_hadro/") "reco hadro")
  ("6" (dired "~/gridpacks/") "gridpacks")
  ("7" (dired "~/llr_met/") "met")
  ("8" (dired "~/lxplus_mc/") "mc")
  )

(global-set-key (kbd "C-x d") 'hydra-dired/body)

(provide 'my_hydra)
;;; my_hydra ends here
