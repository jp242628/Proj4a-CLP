% Funções de ordenação
insertion_sort([], []).
insertion_sort([H|T], Sorted) :-
    insertion_sort(T, SortedTail),
    insert(H, SortedTail, Sorted).

insert(X, [Y|T], [Y|NT]) :-
    X > Y, !, 
    insert(X, T, NT).
insert(X, T, [X|T]).

bubble_sort(List, Sorted) :-
    swap(List, List1), !,
    bubble_sort(List1, Sorted).
bubble_sort(Sorted, Sorted).

swap([X, Y | Rest], [Y, X | Rest]) :-
    X > Y.
swap([Z | Rest], [Z | Rest1]) :-
    swap(Rest, Rest1).

merge_sort([], []).
merge_sort([A], [A]).
merge_sort(List, Sorted) :-
    List = [_, _|_],
    split(List, L1, L2),
    merge_sort(L1, Sorted1),
    merge_sort(L2, Sorted2),
    merge(Sorted1, Sorted2, Sorted).

split([], [], []).
split([A], [A], []).
split([A,B|T], [A|L1], [B|L2]) :-
    split(T, L1, L2).

merge([], L, L).
merge(L, [], L).
merge([A|T1], [B|T2], [A|T]) :-
    A =< B, !,
    merge(T1, [B|T2], T).
merge([A|T1], [B|T2], [B|T]) :-
    merge([A|T1], T2, T).

quick_sort([], []).
quick_sort([H|T], Sorted) :-
    partition(T, H, Left, Right),
    quick_sort(Left, SortedLeft),
    quick_sort(Right, SortedRight),
    append(SortedLeft, [H|SortedRight], Sorted).

partition([], _, [], []).
partition([H|T], Pivot, [H|Left], Right) :-
    H =< Pivot, !,
    partition(T, Pivot, Left, Right).
partition([H|T], Pivot, Left, [H|Right]) :-
    partition(T, Pivot, Left, Right).

% Funções auxiliares
gerar_random_array(0, []).
gerar_random_array(N, [H|T]) :-
    N > 0,
    random_between(1, 10000, H),
    N1 is N - 1,
    gerar_random_array(N1, T).

copia_array(Origem, Destino) :-
    maplist(=, Origem, Destino).

medir_tempo(SortFunc, List, Time) :-
    statistics(runtime, [Start|_]),
    call(SortFunc, List, _),
    statistics(runtime, [End|_]),
    Time is End - Start.

% Função principal
main :-
    Tamanhos = [10, 100, 1000, 10000, 100000],
    testar_tamanhos(Tamanhos).

testar_tamanhos([]).
testar_tamanhos([N|T]) :-
    testar_tamanho(N),
    testar_tamanhos(T).

testar_tamanho(N) :-
    gerar_random_array(N, List),
    medir_tempo(insertion_sort, List, TimeInsertion),
    (TimeInsertion > 60000 -> InsertionResult = 'Excedeu'; InsertionResult = TimeInsertion),

    copia_array(List, ListCopy1),
    medir_tempo(bubble_sort, ListCopy1, TimeBubble),
    (TimeBubble > 60000 -> BubbleResult = 'Excedeu'; BubbleResult = TimeBubble),

    copia_array(List, ListCopy2),
    medir_tempo(merge_sort, ListCopy2, TimeMerge),
    (TimeMerge > 60000 -> MergeResult = 'Excedeu'; MergeResult = TimeMerge),

    copia_array(List, ListCopy3),
    medir_tempo(quick_sort, ListCopy3, TimeQuick),
    (TimeQuick > 60000 -> QuickResult = 'Excedeu'; QuickResult = TimeQuick),

    format('Tamanho da Lista: ~w\tInsertion Sort: ~w\tBubble Sort: ~w\tMerge Sort: ~w\tQuick Sort: ~w~n',
        [N, InsertionResult, BubbleResult, MergeResult, QuickResult]).

% Inicializar o programa
:- initialization(main).
