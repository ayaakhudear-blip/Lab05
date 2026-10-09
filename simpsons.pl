% Males
male(abraham).
male(clancy).
male(herb).
male(homer).
male(bart).

% Females
female(mona).
female(jackie).
female(marge).
female(patty).
female(selma).
female(lisa).
female(maggie).
female(ling).

% Parents
parent(abraham, herb).
parent(abraham, homer).
parent(mona, herb).
parent(mona, homer).

parent(clancy, marge).
parent(clancy, patty).
parent(clancy, selma).
parent(jackie, marge).
parent(jackie, patty).
parent(jackie, selma).

parent(homer, bart).
parent(homer, lisa).
parent(homer, maggie).
parent(marge, bart).
parent(marge, lisa).
parent(marge, maggie).

parent(selma, ling).

% Father and mother
father(X, Y) :-
    parent(X, Y),
    male(X).

mother(X, Y) :-
    parent(X, Y),
    female(X).

% Son and daughter
son(X, Y) :-
    parent(Y, X),
    male(X).

daughter(X, Y) :-
    parent(Y, X),
    female(X).

% Brother and sister
brother(X, Y) :-
    male(X),
    parent(P, X),
    parent(P, Y),
    X \= Y.

sister(X, Y) :-
    female(X),
    parent(P, X),
    parent(P, Y),
    X \= Y.

% Grandfather
grandfather(X, Y) :-
    male(X),
    parent(X, P),
    parent(P, Y).

% Aunt and uncle
aunt(X, Y) :-
    sister(X, P),
    parent(P, Y).

uncle(X, Y) :-
    brother(X, P),
    parent(P, Y).

% Cousin
cousin(X, Y) :-
    parent(P1, X),
    parent(P2, Y),
    parent(G, P1),
    parent(G, P2),
    P1 \= P2,
    X \= Y.

% Ancestor
ancestor(X, Y) :-
    parent(X, Y).

ancestor(X, Y) :-
    parent(X, Z),
    ancestor(Z, Y).