;;; my_pulsar --- Summary
;;; Code: https://github.com/protesilaos/pulsar
;;; Commentary:

(use-package pulsar
  :custom
  (pulsar-pulse-functions
   '(recenter-top-bottom
     move-to-window-line-top-bottom
     reposition-window
     bookmark-jump
     forward-page
     backward-page
     scroll-up-command
     scroll-down-command
     logos-forward-page-dwim
     logos-backward-page-dwim
     org-next-visible-heading
     org-previous-visible-heading
     org-forward-heading-same-level
     org-backward-heading-same-level
     outline-backward-same-level
     outline-forward-same-level
     outline-next-visible-heading
     outline-previous-visible-heading
     outline-up-heading))
  :config
  (pulsar-global-mode 1)
  (setq pulsar-pulse t
		pulsar-delay 0.07
		pulsar-iterations 20 ;; how long it highlights
		pulsar-face 'pulsar-red
		pulsar-highlight-face 'pulsar-yellow
		pulsar-pulse-on-window-change t)
  )
(provide 'my_pulsar)
;;; my_pulsar ends here
