;;; my_hydra --- Summary
;;; Code:
;;; Commentary:

(use-package hydra
  )

(defhydra hydra-dired (:exit t)
  "dired"
  ("t" (dired "~/llr_triggers") "triggers")
  ("e" (dired "~/dot-emacs/custom/") "emacs")
  ("o" (dired "~/org/") "org")
  ("d" (dired "~/Documents/") "Documents")
  ("1" (dired "~/llr_fpgas/bye_splits") "fpgas")
  ("2" (dired "~/llr_fpgas/bye_splits/plot/display") "display")
  ("3" (dired "~/llr_hgctpg/L1Trigger/L1THGCal/test/HGCalTriggerGeomTesterV9Imp3.cc") "hgc-tpg"))

(global-set-key (kbd "C-x d") 'hydra-dired/body)

(provide 'my_hydra)
;;; my_hydra ends here
