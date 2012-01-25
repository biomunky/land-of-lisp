; lisp has cond and case

(defun pudd-eater (person)
  (case person
    ((henry) "it was henry")
    ((MrSöze)  "was the usual suspect")
    (otherwise "hmm someone else!")))

(print (pudd-eater 'henry))
(print (pudd-eater 'MrSöze))
(print (pudd-eater 'dan))
     



