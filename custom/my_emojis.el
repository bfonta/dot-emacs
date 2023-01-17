;;; my_commands --- Summary
;;; Code:
;;; Commentary:

;;TODO: Find a way to avoid duplication of strings
(defun my/emojis (name)
  "Stores custom commands."
  (interactive
   (let ((completion-ignore-case t))
     (list (completing-read "Emoji: "
							'("🎨 Improve structure / format of the code | :art:"
							  "⚡️ Improve performance | :zap:"
							  "🔥 Remove code or files | :fire:"
							  "🐛 Fix a bug | :bug:"
							  "✨ Introduce new features. | :sparkles:"
							  "📝 Add or update documentation | :memo:"
							  "🚀 Deploy stuff | :rocket:"
							  "🎉 Deploy a project | :tada:"
							  "✅ Add, update, or pass tests. :white_check_mark:"
							  "🔖 Release / Version tags :bookmark:"
							  "🚧 Work in progress | :construction:"
							  "🔨 Add or update development scripts | :hammer:"
							  "🔧 Add or update configuration files | :wrench:"
							  "💩 Write bad code that needs to be improved | :poop:"
							  "✏️ Fix typos | :pencil2:"
							  "💥 Introduce breaking changes | :boom:"
							  "🙈 Add or update a .gitignore file | :see_no_evil:"
							  "⚰️ Remove dead code. :coffin:"
							  "🧱 Infrastructure related changes | :bricks:"
							  "🧑‍💻 Improve developer experience | :technologist:"
							  "🦺 Add or update code related to validation | :safety_vest:"
							  "😶 Nothing to say | :no_mouth:"
							  "➕ Plus | :heavy_plus_sign:"
							  "🩹 Simple fix for a non-critical issue | :adhesive_bandage:"
							  "🚑️ Critical hotfix | :ambulance:" "🚑️"
							  ) nil t))))

  (let ((c1 '("🎨 Improve structure / format of the code | :art:" "🎨"))
		(c2 '("⚡️ Improve performance | :zap:" "⚡️"))
		(c3 '("🔥 Remove code or files | :fire:" "🔥"))
		(c4 '("🐛 Fix a bug | :bug:" "🐛"))
		(c5 '("✨ Introduce new features. | :sparkles:" "✨"))
		(c6 '("📝 Add or update documentation | :memo:" "📝"))
		(c7 '("🚀 Deploy stuff | :rocket:" "🚀"))
		(c8 '("🎉 Deploy a project | :tada:" "🎉"))
		(c9 '("✅ Add, update, or pass tests. :white_check_mark:" "✅"))
		(c10 '("🔖 Release / Version tags :bookmark:" "🔖"))
		(c11 '("🚧 Work in progress | :construction:" "🚧"))
		(c12 '("🔨 Add or update development scripts | :hammer:" "🔨"))
		(c13 '("🔧 Add or update configuration files | :wrench:" "🔧"))
		(c14 '("💩 Write bad code that needs to be improved | :poop:" "💩"))
		(c15 '("✏️ Fix typos | :pencil2:" "✏️"))
		(c16 '("💥 Introduce breaking changes | :boom:" "💥"))
		(c17 '("🙈 Add or update a .gitignore file | :see_no_evil:" "🙈"))
		(c18 '("⚰️ Remove dead code. :coffin:" "⚰️"))
		(c19 '("🧱 Infrastructure related changes | :bricks:" "🧱"))
		(c20 '("🧑‍💻 Improve developer experience | :technologist:" "🧑‍💻"))
		(c21 '("🦺 Add or update code related to validation | :safety_vest:" "🦺"))
		(c22 '("😶 Nothing to say | :no_mouth:" "😶"))
		(c23 '("➕ Plus | :heavy_plus_sign:" "➕"))
		(c24 '("🩹 Simple fix for a non-critical issue | :adhesive_bandage:" "🩹"))
		(c25 '("🚑️ Critical hotfix | :ambulance:" "🚑️"))
		)
	
	(cond ((string-equal name (car c1)) (insert (car (last c1))))
	      ((string-equal name (car c2)) (insert (car (last c2))))
		  ((string-equal name (car c3)) (insert (car (last c3))))
		  ((string-equal name (car c4)) (insert (car (last c4))))
		  ((string-equal name (car c5)) (insert (car (last c5))))
		  ((string-equal name (car c6)) (insert (car (last c6))))
		  ((string-equal name (car c7)) (insert (car (last c7))))
		  ((string-equal name (car c8)) (insert (car (last c8))))
		  ((string-equal name (car c9)) (insert (car (last c9))))
		  ((string-equal name (car c10)) (insert (car (last c10))))
		  ((string-equal name (car c11)) (insert (car (last c11))))
		  ((string-equal name (car c12)) (insert (car (last c12))))
		  ((string-equal name (car c13)) (insert (car (last c13))))
		  ((string-equal name (car c14)) (insert (car (last c14))))
		  ((string-equal name (car c15)) (insert (car (last c15))))
		  ((string-equal name (car c16)) (insert (car (last c16))))
		  ((string-equal name (car c17)) (insert (car (last c17))))
		  ((string-equal name (car c18)) (insert (car (last c18))))
		  ((string-equal name (car c19)) (insert (car (last c19))))
		  ((string-equal name (car c20)) (insert (car (last c20))))
		  ((string-equal name (car c21)) (insert (car (last c21))))
		  ((string-equal name (car c22)) (insert (car (last c22))))
		  ((string-equal name (car c23)) (insert (car (last c23))))
		  ((string-equal name (car c24)) (insert (car (last c24))))
		  ((string-equal name (car c25)) (insert (car (last c25))))
	      (t (user-error "Function implementation error. Fix."))
	      )
	))
   
(provide 'my_commands)
;;; my_commands.el ends here
