;;; -*- lexical-binding: nil; -*-

;;; my_thesis --- Summary
;;; Code:
;;; Commentary: https://write.as/dani/writing-a-phd-thesis-with-org-mode

(setf my/thesis-path "~/org/PhD/Thesis/")

(add-to-list 'org-latex-classes
                 '("mimosis"
                   "\\documentclass{mimosis}
 [NO-DEFAULT-PACKAGES]
 [PACKAGES]
 [EXTRA]
\\newcommand{\\mboxparagraph}[1]{\\paragraph{#1}\\mbox{}\\\\}
\\newcommand{\\mboxsubparagraph}[1]{\\subparagraph{#1}\\mbox{}\\\\}"
                   ("\\chapter{%s}" . "\\chapter*{%s}")
                   ("\\section{%s}" . "\\section*{%s}")
                   ("\\subsection{%s}" . "\\subsection*{%s}")
                   ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                   ("\\mboxparagraph{%s}" . "\\mboxparagraph*{%s}")
                   ("\\mboxsubparagraph{%s}" . "\\mboxsubparagraph*{%s}")))

;;;###autoload
(defun my/dired-copy-to-thesis ()
  "Copy the current file in dired-mode to a fixed directory, allowing the user to override if the file already exists."
  (interactive)
  (let ((src (dired-get-file-for-visit)))
    (if src
        (let* ((dest (concat my/thesis-path "figures/")) ; Change this to your desired destination directory
               (destination-file (expand-file-name (file-name-nondirectory src) dest)))
          (if (file-exists-p destination-file)
              (if (yes-or-no-p (format "File %s already exists in %s. Override? " (file-name-nondirectory src) dest))
                  (progn
                    (delete-file destination-file)
                    (copy-file src dest)
                    (message "File copied to %s." dest))
                (message "Copy aborted."))
            (progn
              (copy-file src dest)
              (message "File copied to %s." dest))))
      (message "No file is selected"))))

;;;###autoload
(defun my/open-thesis ()
  (interactive)
  (find-file (concat my/thesis-path "thesis.pdf"))
  )

;;;###autoload
(defun my/open-dis-proceedings ()
  (interactive)
  (find-file (concat my/thesis-path "dis_proceedings.pdf"))
  )

(defun my/org-latex-ref-to-cref (text backend info)
  "Use \\cref instead of \\ref in latex export."
  (when (org-export-derived-backend-p backend 'latex)
    (replace-regexp-in-string "\\\\ref{" "\\\\cref{" text)))
(add-to-list 'org-export-filter-final-output-functions
             'my/org-latex-ref-to-cref)


(provide 'my_thesis)
;;; my_thesis ends here
