;; Funções de ordenação

(defun insertion-sort (lst)
    (labels ((insert (x sorted)
                (cond ((null sorted) (list x))
                    ((<= x (first sorted)) (cons x sorted))
                    (t (cons (first sorted) (insert x (rest sorted)))))))
    (reduce #'insert lst :initial-value nil)))

(defun bubble-sort (lst)
    (loop for swapped = t then nil
        until (not swapped)
        do (setf swapped nil)
            (loop for (a b) on lst
                    when (> a b)
                    do (rotatef a b)
                    (setf swapped t))
        finally (return lst)))

(defun merge-sort (lst)
    (labels ((merge (left right)
                (cond ((null left) right)
                    ((null right) left)
                    ((<= (first left) (first right))
                    (cons (first left) (merge (rest left) right)))
                    (t (cons (first right) (merge left (rest right)))))))
    (let ((len (length lst)))
        (if (<= len 1)
            lst
            (let* ((mid (/ len 2))
                    (left (subseq lst 0 mid))
                    (right (subseq lst mid)))
            (merge (merge-sort left) (merge-sort right))))))

(defun quick-sort (lst)
    (when lst
    (let ((pivot (first lst)))
        (append (quick-sort (remove-if-not #'(lambda (x) (<= x pivot)) lst))
                (remove-if #'(lambda (x) (<= x pivot)) lst)))))

;; Funções auxiliares

(defun gerar-random-array (n)
    (loop repeat n collect (random 10000)))

(defun copia-array (ori)
    (copy-seq ori))

(defun medir-tempo (sort-func lst)
    (let ((start (get-internal-real-time)))
    (funcall sort-func lst)
    (- (get-internal-real-time) start)))

;; Função principal

(defun testar-tamanhos (tamanhos)
    (format t "Tamanho da Lista\tInsertion Sort\t\tBubble Sort\t\tMerge Sort\t\tQuick Sort~%")
    (dolist (n tamanhos)
    (let* ((arr (gerar-random-array n))
            (insertion-time (medir-tempo #'insertion-sort arr))
            (bubble-time (medir-tempo #'bubble-sort arr))
            (merge-time (medir-tempo #'merge-sort arr))
            (quick-time (medir-tempo #'quick-sort arr)))
        (format t "~d\t\t\t" n)
        (if (> insertion-time 60000)
            (format t "Excedeu\t\t")
            (format t "~,6f\t\t" (/ insertion-time 1000.0)))
        (if (> bubble-time 60000)
            (format t "Excedeu\t\t")
            (format t "~,6f\t\t" (/ bubble-time 1000.0)))
        (if (> merge-time 60000)
            (format t "Excedeu\t\t")
            (format t "~,6f\t\t" (/ merge-time 1000.0)))
        (if (> quick-time 60000)
            (format t "Excedeu~%")
            (format t "~,6f~% " (/ quick-time 1000.0))))))

;; Executar o programa

(let ((tamanhos '(10 100 1000 10000 100000)))
    (testar-tamanhos tamanhos))
