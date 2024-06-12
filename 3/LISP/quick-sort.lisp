;; quick-sort.lisp

(defun particionar (pivo lista)
(if (null lista)
    (list nil nil)
    (let ((x (car lista))
            (resto (cdr lista)))
        (if (<= x pivo)
            (let ((particao (particionar pivo resto)))
            (list (cons x (car particao))
                    (cadr particao)))
            (let ((particao (particionar pivo resto)))
            (list (car particao)
                    (cons x (cadr particao))))))))

(defun quick-sort (lista)
(if (null lista)
    nil
    (let* ((pivo (car lista))
            (resto (cdr lista))
            (particao (particionar pivo resto)))
        (let ((menor (car particao))
            (maior (cadr particao)))
        (append (quick-sort menor) (list pivo) (quick-sort maior))))))

(progn
    (format t "Lista original: ~a~%" '(12 11 13 5 6))
    (format t "Quick sort: ~a~%" (quick-sort '(12 11 13 5 6)))
) 