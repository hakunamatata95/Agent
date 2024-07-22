remove(_,[],[]) :- !.
remove(E,[E|T1],T2):- remove(E,T1,T2).
remove(E,[A|B],[A|D]):- remove(E,B,D).

go(a, b, 250).
go(b, a, 250).
go(a, d, 100).
go(d, a, 100).
go(b, c, 170).
go(c, b, 170).
go(c, e, 80).
go(e, c, 80).
go(d, e, 100).
go(e, d, 100).
go(e, f, 150).
go(f, e, 150).

fuelmax(470).
countmax(2).


start(Goal, Goal, _, _, [], _) :- !.

start(From, Goal, Fuel, Count, Visit, [To|Result]):-
    go(From, To, KM),
    Fuel >= KM,
    FuelRemaining is Fuel - KM,
    remove(To, Visit, VisitRemaining),
    start(To, Goal, FuelRemaining, Count, VisitRemaining, Result).

start(From, Goal, Fuel, Count, Visit, [To|Result]):-
    go(From, To, KM),
    Fuel >= KM,
    (To == b; To == c),
    countmax(Mcount),
    Count < Mcount,
    CountAdd is Count + 1,
    fuelmax(FuelMax),
    remove(To, Visit, VisitRemaining),
    start(To, Goal, FuelMax, CountAdd, VisitRemaining, Result).
