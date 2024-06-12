% merge_sort.pl

dividir(L, L1, L2) :-
    meio(L, L1, L2).

meio(L, L1, L2) :-
    length(L, Len),
    Meio is Len // 2,
    length(L1, Meio),
    append(L1, L2, L).

merge([], L, L).
merge(L, [], L).
merge([X|Xs], [Y|Ys], [X|Zs]) :- X =< Y, merge(Xs, [Y|Ys], Zs).
merge([X|Xs], [Y|Ys], [Y|Zs]) :- X > Y, merge([X|Xs], Ys, Zs).

merge_sort([], []).
merge_sort([X], [X]).
merge_sort(Lista, Sorted) :-
    dividir(Lista, L1, L2),
    merge_sort(L1, Sorted1),
    merge_sort(L2, Sorted2),
    merge(Sorted1, Sorted2, Sorted).