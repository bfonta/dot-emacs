;;; -*- lexical-binding: nil; -*-

;;; my_shackle --- Summary
;;; Code:
;;; Commentary: controls how buffers are mapped to windows

(use-package shackle
  :defer t
  :custom

  (shackle-rules
		'(("^\\*?shell.*"		:regexp t   :size 0.5   :select nil	:align 'below	)
		  ("^\\*?term.*"		:regexp t	:size 1.	:same t						)
		  ("^\\*grep\\*.*$"		:regexp t   :size 0.3	:select nil	:align 'below	)
		  ("*Help*"				:regexp nil :size 0.3	:select t	:align 'below	)
		  (".*\\.gz"			:regexp t	:size 1.	:same t						)
		  ("\\*swiper\\*"		:regexp t	:size .25	:select t					)
		  ("^.*Man.*$"			:regexp t	:size 1.	:same t						)
		  ("^.*Proced.*$"		:regexp t	:size 1.	:same t						)
		  ("^.*Occur.*$"		:regexp t	:size 0.25	:select t					)
		  ("^.*magit.*$"		:regexp t	:size 1.	:same t						)
		  ("^.*Completions.*$"	:regexp t	:size 0.25	:select nil					)
		  ("^.*Python.*$"		:regexp t	:size 0.5	:select nil	:align 'below   )
		  ("^.*CrossRef.*$"		:regexp t	:size 0.5	:select nil					)
		  ("^.*arXiv.*$"		:regexp t	:size 0.5	:select nil					)
		  ))
  
	(shackle-default-rule :regexp nil :size 0.3 :align 'below :select t)
	(shackle-mode 1)
  )

(provide 'my_shackle)
;;; my_shackle ends here
