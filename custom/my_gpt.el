;;; my_weather --- Summary
;;; Code: https://github.com/karthink/gptel
;;; Commentary: LLM client

(use-package gptel
  :config
  (setq gptel-default-mode 'org-mode)

  ;; (add-hook 'gptel-post-stream-hook 'gptel-auto-scroll)
  ;; (add-hook 'gptel-post-response-hook 'gptel-end-of-response)

  (defun my/chat ()
	"Alias."
	(interactive)
	(let ((current-prefix-arg 4)) ;; emulate C-u
	  (call-interactively 'gptel-send))
	)

  (defalias 'my/chat-go 'gptel)
  )

(provide 'my_gpt)
;;; my_gpt.el ends here
