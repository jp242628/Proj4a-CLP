(defun ackermann-a (m n)
  (cond
    ((= m 0) (+ n 1))
    ((and (> m 0) (= n 0)) (ackermann-a (- m 1) 1))
    (t (ackermann-a (- m 1) (ackermann-a m (- n 1))))))

(defun compute-a ()
  (loop for m from 0 to 3 do
    (loop for n from 0 to 3 do
      (let ((start-time (get-internal-real-time)))
        (let ((result (ackermann-a m n)))
          (let ((end-time (get-internal-real-time))
                (time-taken (/ (- end-time start-time) internal-time-units-per-second)))
            (if (< time-taken 60.0)
                (format t "A(~A, ~A) = ~A (calculado em ~A sec)~%" m n result time-taken)
                (format t "A(~A, ~A) excedeu limite~%" m n))))))))
