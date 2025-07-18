;;; -*- lexical-binding: nil; -*-

;;; my_weather --- Summary
;;; Code: https://github.com/bcbcarl/emacs-wttrin
;;; Commentary: weather forecast (https://wttr.in/); 'g' to change city, 'q' to quit

(use-package wttrin
  :config
  (setq wttrin-default-cities
		'("Massy" "Paris" "Evora, Portugal" "Lisboa"))
  (defalias 'my/weather 'wttrin)
  )

(provide 'my_weather)
;;; my_weather.el ends here
