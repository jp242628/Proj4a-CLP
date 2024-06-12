:- use_module(library(statistics)).

ackermann_phi(M, N, 0, Result) :-
    Result is M + N.
ackermann_phi(_, _, 1, 0).
ackermann_phi(_, _, 2, 1).
ackermann_phi(M, _, 3, M).
ackermann_phi(M, 0, P, Result) :-
    P > 2,
    P1 is P - 1,
    ackermann_phi(M, 0, P1, Result).
ackermann_phi(M, N, P, Result) :-
    N > 0,
    P > 0,
    N1 is N - 1,
    P1 is P - 1,
    ackermann_phi(M, N1, P, TempResult),
    ackermann_phi(M, TempResult, P1, Result).

compute_phi :-
    between(0, 3, M),
    between(0, 3, N),
    between(0, 4, P),
    time((ackermann_phi(M, N, P, Result), write('φ('), write(M), write(', '), write(N), write(', '), write(P), write(') = '), write(Result), nl)),
    fail.
compute_phi.
