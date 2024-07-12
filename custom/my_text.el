;;; my_text --- Summary
;;; Code:
;;; Commentary: 

;; wrap word around selected region
;; https://emacs.stackexchange.com/questions/3499/how-to-wrap-given-text-around-region
;; only works when the region is selected from the left to the right
(defun my/tag-word-or-region (text-begin text-end)
  "Surround current word or region with given text."
  (interactive "sStart tag: \nsEnd tag: ")
  (let (pois1 pos2 bds)
    (if (and transient-mark-mode mark-active)
        (progn
          (goto-char (region-end))
          (insert text-end)
          (goto-char (region-beginning))
          (insert text-begin))
      (progn
        (setq bds (bounds-of-thing-at-point 'symbol))
        (goto-char (cdr bds))
        (insert text-end)
        (goto-char (car bds))
        (insert text-begin)))))

(provide 'my_text)
;;; my_gitlink ends here


