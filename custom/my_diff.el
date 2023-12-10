;;; my_diff --- Summary
;;; Code:
;;; Commentary:

;;;###autoload
(defun disable-y-or-n-p (orig-fun &rest args)
  "Do not ask for confirmation when quitting."
  (cl-letf (((symbol-function 'y-or-n-p) (lambda (prompt) t)))
    (apply orig-fun args)))
(advice-add 'ediff-quit :around #'disable-y-or-n-p)

;;;###autoload
(defun diff-region-format-region-boundary (b e)
  "Diff two regions. Step 1: Select a region and `M-x diff-region-a'. Step 2: Select another region and `M-x diff-region-b'. Press 'q' in evil-mode or 'C-c C-c' to exit the diff output buffer. Make sure lines are selected and B is less than E"
  (let (tmp rlt)
    ;; swap b e, make sure b < e
    (when (> b e)
      (setq tmp b)
      (setq b e)
      (set e tmp))

    ;; select lines
    (save-excursion
      ;; Another workaround for evil-visual-line bug:
      ;; In evil-mode, if we use hotkey V or `M-x evil-visual-line` to select line,
      ;; the (line-beginning-position) of the line which is after the last selected
      ;; line is always (region-end)! Don't know why.
      (if (and (> e b)
               (save-excursion (goto-char e) (= e (line-beginning-position)))
               (boundp 'evil-state) (eq evil-state 'visual))
          (setq e (1- e)))
      (goto-char b)
      (setq b (line-beginning-position))
      (goto-char e)
      (setq e (line-end-position)))
    (setq rlt (list b e))
    rlt))

;;;###autoload
(defun diff-region-exit ()
  (interactive)
  (bury-buffer "*Diff-region-output*")
  (winner-undo))

;;;###autoload
(defun my/diff-region-a ()
  "Select a region to compare"
  (interactive)
  (when (region-active-p)
    (let (tmp buf)
      ;; select lines
      (setq tmp (diff-region-format-region-boundary (region-beginning) (region-end)))
      (setq buf (get-buffer-create "*Diff-regionA*"))
      (save-current-buffer
        (set-buffer buf)
        (erase-buffer))
      (append-to-buffer buf (car tmp) (cadr tmp))))
  (message "Now select other region to compare and run `diff-region-b`"))

;;;###autoload
(defun my/diff-region-b ()
  "Compare current region with region selected by `diff-region-tag-selected-as-a' "
  (interactive)
  (if (region-active-p)
      (let (rlt-buf
            diff-output
            (fa (make-temp-file (expand-file-name "scor"
                                                  (or small-temporary-file-directory
                                                      temporary-file-directory))))
            (fb (make-temp-file (expand-file-name "scor"
                                                  (or small-temporary-file-directory
                                                      temporary-file-directory)))))
        ;;  save current content as file B
        (when fb
          (setq tmp (diff-region-format-region-boundary (region-beginning) (region-end)))
          (write-region (car tmp) (cadr tmp) fb))

        (setq rlt-buf (get-buffer-create "*Diff-region-output*"))
        (when (and fa (file-exists-p fa) fb (file-exists-p fb))
          ;; save region A as file A
          (save-current-buffer
            (set-buffer (get-buffer-create "*Diff-regionA*"))
            (write-region (point-min) (point-max) fa))
          ;; diff NOW!
          (setq diff-output (shell-command-to-string (format "diff -Nabur %s %s" fa fb)))
          ;; show the diff output
          (if (string= diff-output "")
              ;; two regions are same
              (message "Two regions are SAME!")
            ;; show the diff
            (save-current-buffer
              (switch-to-buffer-other-window rlt-buf)
              (set-buffer rlt-buf)
              (erase-buffer)
              (insert diff-output)
              (diff-mode)
              (if (fboundp 'evil-local-set-key)
                           (evil-local-set-key 'normal "q" 'diff-region-exit))
              (local-set-key (kbd "C-c C-c") 'diff-region-exit)
              )))

        ;; clean the temporary files
        (if (and fa (file-exists-p fa))
            (delete-file fa))
        (if (and fb (file-exists-p fb))
            (delete-file fb)))
    (message "Please select region at first!")))

(provide 'my_diff)
;;; my_diff ends here
