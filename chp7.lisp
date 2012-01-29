(defparameter *wizard-nodes*
  '((living-room (you are in the living room. A wizard is snoring on the couch.))
    (garden (you are in the garden. There is a well in front of you.))
    (attic (you are in the attic.  There is a giant welding torch in front of you))))

(defparameter *wizard-edges*
  '( (living-room (garden west door) (attic upstairs ladder))
     (garden (living-room east door))
     (attic (living-room downstairs ladder))))

;(substitute-if #\e #'digit-char-p "I'm a l33t hack3r")
; alphanumericp - Returns true if character is an alphabetic character or a numeric character; otherwise, returns false. 
;(print1-to-string x) -> turns x into a string we can then modify
(defun dot-name (exp)
  (substitute-if #\_ (complement #'alphanumericp) (prin1-to-string exp)))

;complement #'alphanumeric -> creates a REGEXP that matches all non-alpha.. hence the 
;complement part.


; keep the label length to a max
(defparameter *max-label-length* 30)

(defun dot-label (exp)
  (if exp
      (let ((s (write-to-string exp :pretty nil)))
	(if (> (length s) *max-label-length*)
	    (concatenate 'string (subseq s 0 (- *max-label-length* 3)) "...")
	  s))
    ""))

(defun nodes->dot (nodes)
  (mapc (lambda (node)
	  (fresh-line)
	  (princ (dot-name (car node)))
	  (princ "[label=\"")
	  (princ (dot-label node))
	  (princ "\"];"))
	nodes))

(defun edges->dot (edges)
  (mapc (lambda (node)
	  (mapc (lambda (edge)
		  (fresh-line)
		  (princ (dot-name (car node)))
		  (princ "->")
		  (princ (dot-name (car edge)))
		  (princ "[label=\"")
		  (princ (dot-label (cdr edge)))
		  (princ "\"]"))
		(cdr node)))
	edges))


(defun graph->dot (nodes edges)
  (princ "digraph{")
  (nodes->dot nodes)
  (edges->dot edges)
  (princ "}"))

(defun dot->png (fname thunk)
  (with-open-file (*standard-output*
		   fname
		   :direction :output
		   :if-exists :supersede)
		  (funcall thunk))
  (ext:shell (concatenate 'string "dot -Tpng -O " fname)))

; EXAMPLE OF USING with-open-file
;(with-open-file (my-stream
;   "testfile.txt"
;   :direction :output
;   :if-exists :supercede)
; (princ "Hello, World!" my-stream))

(defun graph->png (fname nodes edges)
  (dot->png fname
	    (lambda ()
	      (graph->dot nodes edges))))

(graph->png "wizard.dot" *wizard-nodes* *wizard-edges*)


