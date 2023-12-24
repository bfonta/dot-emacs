;;; my_weather --- Summary
;;; Code: https://github.com/bcbcarl/emacs-wttrin
;;; Commentary: weather forecast (https://wttr.in/)

(use-package wttrin
  :config
  (setq wttrin-default-cities
		'("Massy" "Paris" "Evora, Portugal" "Lisboa"))
  (defalias 'weather 'wttrin)
  )

(provide 'my_weather)
;;; my_weather.el ends here
