(defun ackermann-phi (m n p)
  (cond
    ((= p 0) (+ m n))
    ((= p 1) 0)
    ((= p 2) 1)
    ((= p 3) m)
    ((and (> p 2) (= n 0)) (ackermann-phi m 0 (- p 1)))
    (t (ackermann-phi m (ackermann-phi m (- n 1) p) (- p 1)))))

(defun compute-phi ()
  (loop for m from 0 to 3 do
    (loop for n from 0 to 3 do
      (loop for p from 0 to 4 do
        (let ((start-time (get-internal-real-time)))
          (let ((result (ackermann-phi m n p)))
            (let ((end-time (get-internal-real-time))
                  (time-taken (/ (- end-time start-time) internal-time-units-per-second)))
              (if (< time-taken 60.0)
                  (format t "φ(~A, ~A, ~A) = ~A (calculado em ~A sec)~%" m n p result time-taken)
                  (format t "φ(~A, ~A, ~A) excedeu o limite ~%" m n p)))))))))
