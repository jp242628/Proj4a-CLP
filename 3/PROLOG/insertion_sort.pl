% insertion_sort.pl

inserir(X, [], [X]).
inserir(X, [H|T], [X, H|T]) :-
    X =< H.
inserir(X, [H|T], [H|R]) :-
    X > H,
    inserir(X, T, R).

ordenar_insertion([], []).
ordenar_insertion([H|T], R) :-
    ordenar_insertion(T, X),
    inserir(H, X, R).