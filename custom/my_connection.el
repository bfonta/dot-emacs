;;; -*- lexical-binding: nil; -*-

;;; my_connection --- Summary
;;; Code:
;;; Commentary:

;; meant to make sshfs faster to the expense of no remote version control
(setq vc-handled-backends nil)

(setq vc-follow-symlinks t)

;;;###autoload
(defun my/sshfs-mount-string (locfolder machine rempath)
  "Runs sshfs for LLR machines, via local sshloc function."
  (concat "sshloc -l " locfolder
		  " -r " machine
		  " -d " rempath)
  )

;;;###autoload
(defun my/sshfs-unmount-string (locfolder)
  "Runs sshfs for LLR machines, via local sshloc function."
  (concat "fusermount -q -u " locfolder "/")
  )

;;;###autoload
(defun my/connect (server)
  "Connects to a server. /scp: ssh for small files, scp for large files /ssh: always ssh."
  (interactive
   (let ((completion-ignore-case t))
     (list (completing-read "Server: " '("Triggers" "FPGAs" "HGC-TPG" "RecoHadro" "KLUB Triggers" "KLUB Production" "BigNtuples" "Gridpacks" "P5") nil t))))

  (cond ((string-equal server "Triggers")
		 (let ((default-directory
				 "/scp:alves@llr:/home/llr/cms/alves/CMSSW_12_5_0_pre1/src/METTriggerStudies/"))
		   (dired default-directory)
		   (if (get-buffer "shell_triggers")
			   (shell (concat "shell_" (read-string "Triggers new shell buffer: shell_")))
			 (shell "shell_llr"))))

		((string-equal server "FPGAs")
		 (let ((default-directory
				 "/scp:alves@llr:/home/llr/cms/alves/CMSSW_12_5_0_pre1/src/bye_splits/"))
		   (dired default-directory)
		   (if (get-buffer "shell_fpgas")
			   (shell (concat "shell_" (read-string "FPGAs new shell buffer: shell_")))
			 (shell "shell_llr"))))

		((string-equal server "HGC-TPG")
		 (let ((default-directory
				 "/scp:alves@llr:/home/llr/cms/alves/CMSSW_12_5_0_pre4/src/"))
		   (dired default-directory)
		   (if (get-buffer "shell_hgc_tpg")
			   (shell (concat "shell_" (read-string "HGC-TPG new shell buffer: shell_")))
			 (shell "shell_hgc_tpg"))))

		((string-equal server "RecoHadro")
		 (let ((default-directory
				 "/scp:alves@llr:/home/llr/cms/alves/CMSSW_12_6_0_pre4/src/"))
		   (dired default-directory)
		   (if (get-buffer "shell_reco_hadro")
			   (shell (concat "shell_" (read-string "RecoHadro new shell buffer: shell_")))
			 (shell "shell_reco_hadro"))))

		((string-equal server "KLUB Triggers")
		 (let ((default-directory
				 "/scp:alves@llr:/home/llr/cms/alves/CMSSW_11_1_9/src/KLUBAnalysis/"))
		   (dired default-directory)
		   (if (get-buffer "shell_klub")
			   (shell (concat "shell_" (read-string "KLUB Triggers new shell buffer: shell_")))
			 (shell "shell_klub")))
		 (add-to-list
		  'tramp-remote-path
		  "/cvmfs/cms.cern.ch/slc7_amd64_gcc820/cms/cmssw/CMSSW_11_1_9/external/slc7_amd64_gcc820/bin/git")
		 )
		
		((string-equal server "KLUB Production")
		 (let ((default-directory
				 "/scp:alves@llr:/home/llr/cms/alves/CMSSW_12_6_0_pre3/src/KLUBAnalysis/"))
		   (dired default-directory)
		   (if (get-buffer "shell_klub")
			   (shell (concat "shell_" (read-string "KLUB Triggers new shell buffer: shell_")))
			 (shell "shell_klub")))
		 (add-to-list
		  'tramp-remote-path
		  "/cvmfs/cms.cern.ch/slc7_amd64_gcc820/cms/cmssw/CMSSW_12_6_0_pre3/external/slc7_amd64_gcc820/bin/git")
		 )

		((string-equal server "BigNtuples")
		 (let ((default-directory
				 "/scp:bfontana@lxplus:/afs/cern.ch/work/b/bfontana/"))
		   (dired default-directory)
		   (if (get-buffer "shell_big_ntuples")
			   (shell (concat "shell_" (read-string "Big Ntuples new shell buffer: shell_")))
			 (shell "shell_big_ntuples")))
		 )

		((string-equal server "Gridpacks")
		 (let ((default-directory
				 "/scp:alves@lxplus:/afs/cern.ch/work/b/bfontana/"))
		   (dired default-directory)
		   (if (get-buffer "shell_gridpacks")
			   (shell (concat "shell_" (read-string "Gridpacks new shell buffer: shell_")))
			 (shell "shell_gridpacks")))
		 )

		((string-equal server "P5")
		 (let ((default-directory
				 "/scp:bfontana@cmsusr:/nfshome0/bfontana/"))
		   (dired default-directory)
		   (if (get-buffer "shell_p5")
			   (shell (concat "shell_" (read-string "P5 new shell buffer: shell_")))
			 (shell "shell_p5"))))

		(t (user-error "Function implementation error. Fix."))
		)
  
  (cond ((string-equal server "Triggers")
		 (insert "cmsenv; conda activate Trigger;"))
		((string-equal server "FPGAs")
		 (insert "conda activate FPGA; cmsenv;"))
		((string-equal server "HGC-TPG")
		 (insert "cmsenv;"))
		((string-equal server "RecoHadro")
		 (insert "cmsenv;"))
		((string-equal server "KLUB Triggers")
		 (insert "cmsenv;"))
		((string-equal server "KLUB Production")
		 (insert "cmsenv;"))
		((string-equal server "BigNtuples")
		 (insert "cd CMSSW_10_6_29/src/LLRHiggsTauTau; cmsenv;"))
		((string-equal server "Gridpacks")
		 (insert "cd /afs/cern.ch/work/b/bfontana/genproductions/bin/MadGraph5_aMCatNLO; cmsenv;"))
		((string-equal server "P5")
		 (insert ". /nfshome0/ecaldev/utils/pro;"))
		(t (user-error "Function implementation error. Fix."))
		)
  (comint-send-input)
  )

;;;###autoload
(defun my/sshfs (server)
  "Runs sshfs for some server machine.
Starts by disconnecting some sshfs connection on the same folder."
  (interactive
   (let ((completion-ignore-case t))
     (list (completing-read "Server: " '("Triggers" "FPGAs" "HGC-TPG" "RecoHadro" "KLUB Triggers" "KLUB Production" "BigNtuples" "Gridpacks" "P5") nil t))))

  (let ((buffer (concat "*shell_sshfs_" server "*")) (wth (window-total-height)))
	(unless (or (eq major-mode 'shell-mode) (< wth 12) (get-buffer-window buffer t))
	  (split-window-below (round (* -0.35 wth)))
	  (other-window 1))
	(shell buffer)

	(cond ((string-equal server "FPGAs")
		   (insert (concat (my/sshfs-unmount-string "llr_fpgas")
						   "; "
						   (my/sshfs-mount-string "llr_fpgas" "llr"
												  "/home/llr/cms/alves/CMSSW_12_5_0_pre1/src/bye_splits; "))))
		  ((string-equal server "HGC-TPG")
		   (insert (concat (my/sshfs-unmount-string "llr_hgctpg")
						   "; "
						   (my/sshfs-mount-string "llr_hgctpg" "llr"
												  "/home/llr/cms/alves/CMSSW_12_5_0_pre4/src/; "))))
		  ((string-equal server "RecoHadro")
		   (insert (concat (my/sshfs-unmount-string "llr_reco_hadro")
						   "; "
						   (my/sshfs-mount-string "llr_reco_hadro" "llr"
												  "/home/llr/cms/alves/CMSSW_12_6_0_pre4/src/; "))))
		  ((string-equal server "KLUB Triggers")
		   (insert (concat (my/sshfs-unmount-string "klub")
						   "; "
						 (my/sshfs-mount-string "klub" "llr"
												"/home/llr/cms/alves/CMSSW_11_1_9/src/KLUBAnalysis"))))

		  ((string-equal server "KLUB Production")
		   (insert (concat (my/sshfs-unmount-string "klub")
						   "; "
						 (my/sshfs-mount-string "klub" "llr"
												"/home/llr/cms/alves/CMSSW_12_6_0_pre3/src/KLUBAnalysis"))))

		  ((string-equal server "BigNtuples")
		   (insert (concat (my/sshfs-unmount-string "big_ntuples")
						   "; "
						   (my/sshfs-mount-string "big_ntuples" "lxplus"
												  "/afs/cern.ch/work/b/bfontana/CMSSW_10_6_29/src/"))))

		  ((string-equal server "Gridpacks")
		   (insert (concat (my/sshfs-unmount-string "gridpacks")
						   "; "
						   (my/sshfs-mount-string "gridpacks" "llr"
												  "/afs/cern.ch/work/b/bfontana/bin/MadGraph5_aMCatNLO"))))
		  
		  ((string-equal server "P5")
		   (insert (concat (my/sshfs-unmount-string "p5")
						   "; "
						   (my/sshfs-mount-string "p5" "cmsusr"
												  "/nfshome0/bfontana/"))
				   ))
		  
		  (t (user-error "Function implementation error. Fix."))
		  )
	(comint-send-input)
	)
  )

;;;###autoload
(defun my/ssh_port ()
  "Runs sshfs for some server machine.
Starts by disconnecting some sshfs connection on the same folder."
  (interactive)
  (let* ((command "ssh -L <port>:<host>:<port> -N <gate>")
		(port (read-string "Port number: " "8003" nil "8003"))
		(host (read-string "Host: " "llruicms01.in2p3.fr" nil "llruicms01.in2p3.fr"))
		(gate (read-string "Gate: " "alves@llrgate01.in2p3.fr" nil "alves@llrgate01.in2p3.fr"))

		(buffer (concat "*ssh_port_" port "*"))
		(wth (window-total-height))
		)
	
	(unless (or (eq major-mode 'shell-mode) (< wth 12) (get-buffer-window buffer t))
	  (split-window-below (round (* -0.35 wth)))
	  (other-window 1))
	(shell buffer)

	(insert (s-replace "<gate>" gate (s-replace "<host>" host (s-replace "<port>" port command))))
	(comint-send-input)
	)
  )

; disable company-mode in remote dired environments."
(add-hook 'dired-mode-hook
	  (lambda ()
	    (when (and (fboundp 'company-mode)
		       (file-remote-p default-directory))
	      (company-mode -1))))

; hide password input
;; (setq comint-password-prompt-regexp
;;       (concat comint-password-prompt-regexp
;; 			  "\\|^Password:.*\'"
;; 			  "\\|^Repeat for confirmation:.*\'"
;; 			  "\\|^Enter PEM pass phrase:.*\'"
;; 			  "\\|^Enter it again:.*\'" ))

; when t emacs does not read the shell history, rather the tramp history
; https://www.gnu.org/software/emacs/manual/html_node/emacs/Shell-Ring.html
(setq tramp-histfile-override nil)
(setq tramp-backup-directory-alist nil)
(setq tramp-auto-save-directory (expand-file-name "~/.emacs.d/tramp-autosaves/"))
(setq tramp-verbose 1) ;; Change to 0 to completely disable echoing

(provide 'my_connection)
;;; my_connection ends here
