;;; my_replace --- Summary
;;; Code:
;;; Commentary:


;;;###autoload
(defun my/batch-replace-strings (replacement-alist)
  "Prompt user for pairs of strings to search/replace, then do so in the current buffer (https://stackoverflow.com/questions/8682079/batch-replace-a-bunch-of-strings-in-a-text-file-with-emacs)"
  (interactive (list (batch-replace-strings-prompt)))
  (dolist (pair replacement-alist)
    (save-excursion
      (replace-regexp (car pair) (cdr pair)))))

;;;###autoload
(defun batch-replace-strings-prompt ()
  "prompt for string pairs and return as an association list"
  (let (from-string
        ret-alist)
    (while (not (string-equal "" (setq from-string (read-string "String to search (RET to stop): "))))
      (setq ret-alist
            (cons (cons from-string (read-string (format "Replace %s with: " from-string)))
                  ret-alist)))
    ret-alist))

(provide 'my_replace)
;;; my_replace ends here
