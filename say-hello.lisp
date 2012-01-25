(defun say-hello ()
  (print "Please type your name: ")
  (let ((name (read)))
    (print "Nice to meet you, ")
    (print name)))

; A better say-hello
; that uses read-line to
; read all args as a string

(defun say-hi ()
  (print "Please enter your name:")
  (let ((name (read-line)))
    (princ "Nice to meet you, ")
    (princ name)))




