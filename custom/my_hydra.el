;;; my_hydra --- Summary
;;; Code:
;;; Commentary:

(use-package hydra
  )

(defhydra hydra-dired (:exit t)
  "dired"
  ("f" (dired "~/llr_fpgas/bye_splits") "fpgas")
  ("d" (dired "~/llr_fpgas/bye_splits/plot/display") "display")
  ("t" (dired "~/llr_triggers") "triggers")
  ("e" (dired "~/dot-emacs/custom/") "emacs"))
(global-set-key (kbd "C-x C-d") 'hydra-dired/body)

(provide 'my_hydra)
;;; my_hydra ends here
