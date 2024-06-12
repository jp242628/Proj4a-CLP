;; insertion-sort.lisp

(defun inserir (x lista)
  (if (null lista)
      (list x)
      (if (<= x (car lista))
          (cons x lista)
          (cons (car lista) (inserir x (cdr lista))))))

(defun ordenar-insertion (lista)
  (if (null lista)
      nil
      (inserir (car lista) (ordenar-insertion (cdr lista)))))

;; Para testar os algoritmos:
(progn
  (format t "Lista original: ~a~%" '(12 11 13 5 6))
  (format t "Insertion sort: ~a~%" (ordenar-insertion '(12 11 13 5 6)))
)
