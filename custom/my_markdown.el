;;; -*- lexical-binding: nil; -*-

;;; my_markdown --- Summary
;;; Code:
;;; Commentary:

(use-package markdown-mode
  :defer t
  :mode ("\\.md\\'" . markdown-mode))

(use-package impatient-mode
  :defer t
  :ensure t
  :mode ("\\.md\\'" . markdown-mode)
  :config
  (defun markdown-html (buffer)
	(princ (with-current-buffer buffer
			 (format "<!DOCTYPE html><html><title>Bruno Alves' custom Markdown Renderer</title><xmp theme=\"united\" style=\"display:none;\"> %s  </xmp><script src=\"http://strapdownjs.com/v/0.2/strapdown.js\"></script></html>" (buffer-substring-no-properties (point-min) (point-max))))
		   (current-buffer)))
										; M-x imp-set-user-filter RET markdown-html RET

  )

(provide 'my_markdown)
;;; my_markdown ends here
