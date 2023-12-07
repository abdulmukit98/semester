male(mukit).
male(arif).
female(nazneen).
female(nazia).
female(sifat).

parent(arif, mukit).
parent(nazneen, mukit).

parent(arif, nazia).
parent(nazneen, nazia).

parent(arif, sifat).
parent(nazneen, sifat).

sibling(mukit, nazia).
sibling(mukit, sifat).
sibling(nazia, sifat).

father(X,Y):-
    parent(X,Y), male(X).

mother(X,Y):-
    parent(X,Y), female(X).

brother(X,Y):-
    sibling(X,Y), male(X).

sister(X,Y):-
    sibling(X,Y), female(X).
