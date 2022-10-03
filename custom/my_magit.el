;;; my_magit --- Summary
;;; Code:
;;; Commentary:

(use-package magit
  :defer t
  :bind ("C-x g" . magit-status)
  :config
  (add-to-list
   'tramp-remote-path
   "/cvmfs/cms.cern.ch/slc7_amd64_gcc820/cms/cmssw/CMSSW_11_1_9/external/slc7_amd64_gcc820/bin/git")
  (setq magit-remote-git-executable "/cvmfs/cms.cern.ch/slc7_amd64_gcc820/cms/cmssw/CMSSW_11_1_9/external/slc7_amd64_gcc820/bin/git")

  (add-hook 'git-commit-setup-hook ;; (add-hook 'git-commit-mode
			(lambda ()
              (when (derived-mode-p 'text-mode)
				(yas-activate-extra-mode 'git-snippets-commit-mode))))
  )

;;; Reference: https://github.com/emacsmirror/git-timemachine
(use-package git-timemachine
  :after magit
  :bind ("C-x h" . git-timemachine)
  )

(provide 'my_magit)
;;; my_magit ends here
