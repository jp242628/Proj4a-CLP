;; bubble-sort.lisp

(defun trocar (lista)
  (if (null (cdr lista))
      lista
      (if (> (car lista) (cadr lista))
          (cons (cadr lista) (trocar (cons (car lista) (cddr lista))))
          (cons (car lista) (trocar (cdr lista))))))

(defun bubble-sort (lista)
  (if (null lista)
      nil
      (let ((troca (trocar lista)))
        (if (equal lista troca)
            lista
            (bubble-sort troca)))))

;; Para testar os algoritmos:
(progn
  (format t "Lista original: ~a~%" '(12 11 13 5 6))
  (format t "Bubble sort: ~a~%" (bubble-sort '(12 11 13 5 6)))
)
