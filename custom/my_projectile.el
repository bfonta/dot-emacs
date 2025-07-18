;;; -*- lexical-binding: nil; -*-

;;; my_projectile --- Summary
;;; Code:
;;; Commentary: 

(use-package projectile
  :ensure t
  :demand t
  :bind (("C-c p" . projectile-command-map))
  :custom
  (projectile-mode t)
  (projectile-completion-system 'default)
  (projectile-enable-caching t)
  (projectile-enable-caching 'persistent)
  (projectile-indexing-method 'alien)

  ;; Enable projectile in all buffers
  (add-hook 'find-file-hook 'projectile-find-file-hook)

  ;; Keybindings for common projectile commands
  (global-set-key (kbd "C-c p p") 'projectile-switch-project)
  (global-set-key (kbd "C-c p f") 'projectile-find-file)
  (global-set-key (kbd "C-c p d") 'projectile-find-dir)
  (global-set-key (kbd "C-c p b") 'projectile-switch-to-buffer)
  (global-set-key (kbd "C-c p g") 'projectile-grep)
  (global-set-key (kbd "C-c p r") 'projectile-replace)
  (global-set-key (kbd "C-c p c") 'projectile-compile-project)
  (global-set-key (kbd "C-c p t") 'projectile-test-project)
  (global-set-key (kbd "C-c p s") 'projectile-regenerate-tags)

  ;; Enable projectile-rails if you are working with Ruby on Rails projects
  (when (require 'projectile-rails nil t)
    (projectile-rails-mode))

  ;; Enable projectile-flycheck if you are using flycheck
  (when (require 'flycheck nil t)
    (add-hook 'flycheck-mode-hook 'projectile-flycheck-setup))

  ;; Enable projectile-ag if you are using the silver searcher (ag)
  (when (require 'projectile-ag nil t)
    (setq projectile-ag-command "ag")
    (setq projectile-ag-options '("--nogroup" "--nobreak" "--hidden"))
    (setq projectile-ag-suppress-files '(".git/" ".hg/" ".svn/" ".DS_Store"))
    (setq projectile-ag-suppress-dirs '(".git" ".hg" ".svn"))))

(provide 'my_projectile)
;;; my_projectile ends here

