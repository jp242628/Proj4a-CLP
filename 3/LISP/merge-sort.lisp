;; merge-sort.lisp

(defun merge-sort (lst)
"Ordena uma lista usando o algoritmo merge sort."
(if (or (null lst) (null (cdr lst)))
    lst
    (let ((mid (truncate (length lst) 2)))
        (merge (merge-sort (subseq lst 0 mid))
            (merge-sort (subseq lst mid))
            #'<))))

(defun merge (l1 l2 pred)
"Mescla duas listas ordenadas em uma única lista ordenada."
(cond ((null l1) l2)
        ((null l2) l1)
        ((funcall pred (car l1) (car l2))
        (cons (car l1) (merge (cdr l1) l2 pred)))
        (t (cons (car l2) (merge l1 (cdr l2) pred)))))

(format t "Lista original: ~a~%" '(5 3 1 2 4))
(format t "Merge sort: ~a~%" (merge-sort '(5 3 1 2 4))))
