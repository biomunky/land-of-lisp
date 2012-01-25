(defvar *arch-enemy* nil)

(defun pudding-eater (person)
  (cond ((eq person 'henry) (setf *arch-enemy* 'stupid-lisp-alien)
	 '(curse you lisp alien - you ate my pudding))
	((eq person 'johnny) (setf *arch-enemy* 'useless-old-johnny)
	 '(i hope you choked on my pudding))
	(t '(why eat my pudding stranger))))

(print (pudding-eater 'johnny))
(print *arch-enemy*)
(print (pudding-eater 'henry))
(print *arch-enemy*)
(print (pudding-eater 'sriv))
(print *arch-enemy*)
