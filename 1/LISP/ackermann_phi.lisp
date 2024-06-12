(defun ackermann-phi (m n p)
  (cond
    ((= p 0) (+ m n))
    ((= p 1) 0)
    ((= p 2) 1)
    ((= p 3) m)
    ((and (> p 2) (= n 0)) (ackermann-phi m 0 (- p 1)))
    (t (ackermann-phi m (ackermann-phi m (- n 1) p) (- p 1)))))

(print (ackermann-phi 2 3 4))
