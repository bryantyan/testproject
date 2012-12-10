(defun random-string (string-list)
 "get random string from a string-list"
 (let ((rn (random (20))))
  (concat (nth rn string-list) "\n")
 )
)
