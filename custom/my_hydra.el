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
  ("d" (dired "~/Documents/") "Documents")
  ("w" (dired "~/Downloads/") "Downloads")
  ("1" (dired "~/llr_fpgas/bye_splits") "fpgas")
  ("2" (dired "~/llr_hgctpg/L1Trigger/L1THGCal/test/HGCalTriggerGeomTesterV9Imp3.cc") "hgc-tpg")
  ("3" (dired "~/llr_hgctpg/L1Trigger/L1THGCal/plugins/geometries/HGCalTriggerGeometryV9Imp3.cc") "hgc-tpg")
  ("4" (dired "~/big_ntuples/") "big ntuples")
  ("5" (dired "~/llr_reco_hadro/") "reco hadro")
  )

(global-set-key (kbd "C-x d") 'hydra-dired/body)

(provide 'my_hydra)
;;; my_hydra ends here
