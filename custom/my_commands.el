;;; -*- lexical-binding: nil; -*-

;;; my_commands --- Summary
;;; Code:
;;; Commentary:

;;;###autoload
(defun my/shell-commands (name)
  "Stores custom commands."
  (interactive
   (let ((completion-ignore-case t))
     (list (completing-read "Command: "
							'("FPGA display: launch bokeh server"
							  "FPGA display: run code locally"
							  "SSH jump tunnel"
							  ) nil t))))

  (let ((command1 '("FPGA display: launch bokeh server" "bokeh serve bye_splits/plot/display/ --address llruicms01.in2p3.fr --port <port>  --allow-websocket-origin=localhost:<port>"))
		(command2 '("FPGA display: run code locally" "python bye_splits/plot/display/main.py"))
		(command3 '("SSH jump tunnel" "ssh -L <port>:llruicms01.in2p3.fr:<port> -N alves@llrgate01.in2p3.fr"))
		)
	
	(cond ((string-equal name (car command1))
		   (let ((port (read-string "Port number: " "8003" nil "8003")))
			 (insert (s-replace "<port>" port (car (last command1))))))
		  
	      ((string-equal name (car command2))
		   (insert (car (last command2))))

		  ((string-equal name (car command3))
		   (let ((port (read-string "Port number: " "8003" nil "8003")))
			 (insert (s-replace "<port>" port (car (last command3))))))
		  
	      (t (user-error "Function implementation error. Fix."))
	      )
	)
  (comint-send-input)
  )
   
(provide 'my_commands)
;;; my_commands.el ends here
