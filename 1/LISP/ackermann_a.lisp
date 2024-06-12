(defun ackermann-a (m n)
  (cond
    ((= m 0) (+ n 1))
    ((and (> m 0) (= n 0)) (ackermann-a (- m 1) 1))
    (t (ackermann-a (- m 1) (ackermann-a m (- n 1))))))

(print (ackermann-a 2 3))
