ackermann_a(0, N, Result) :-
    Result is N + 1.
ackermann_a(M, 0, Result) :-
    M > 0,
    M1 is M - 1,
    ackermann_a(M1, 1, Result).
ackermann_a(M, N, Result) :-
    M > 0,
    N > 0,
    M1 is M - 1,
    N1 is N - 1,
    ackermann_a(M, N1, TempResult),
    ackermann_a(M1, TempResult, Result).
