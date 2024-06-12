% bubble_sort.pl

trocar([X,Y|T], [Y,X|T]) :- X > Y.
trocar([Z|T], [Z|T1]) :- trocar(T, T1).

bubble_sort(L, S) :- trocar(L, L1), !, bubble_sort(L1, S).
bubble_sort(S, S).