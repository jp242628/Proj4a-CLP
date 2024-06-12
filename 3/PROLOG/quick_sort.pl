% quick_sort.pl

particionar(_, [], [], []).
particionar(Pivo, [X|Resto], [X|Menor], Maior) :-
    X =< Pivo,
    particionar(Pivo, Resto, Menor, Maior).
particionar(Pivo, [X|Resto], Menor, [X|Maior]) :-
    X > Pivo,
    particionar(Pivo, Resto, Menor, Maior).

quick_sort([], []).
quick_sort([X|Resto], Sorted) :-
    particionar(X, Resto, Menor, Maior),
    quick_sort(Menor, SortedMenor),
    quick_sort(Maior, SortedMaior),
    append(SortedMenor, [X|SortedMaior], Sorted).