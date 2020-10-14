:- use_module(library(clpfd)).

%Rules

piezaBlanca(X):-caballoBlanco(X).
piezaNegra(X):-caballoNegro(X).


mover(K,Xo,Yo,Xf,Yf):-
	caballoBlanco(K),
	casilla(K,Xo,Yo),
	(casilla(v,Xf,Yf) ; piezaNegra(X), casilla(X,Xf,Yf)),
	(Xf is Xo + 1 ; Xf is Xo -1),
	(Yf is Yo + 2 ; Yf is Yo -2).

mover(K,Xo,Yo,Xf,Yf):-
	caballoBlanco(K),
	casilla(K,Xo,Yo),
	(casilla(v,Xf,Yf) ; piezaNegra(X), casilla(X,Xf,Yf)),
	(Xf is Xo + 2 ; Xf is Xo -2),
	(Yf is Yo + 1 ; Yf is Yo -1).

%facts
vacio(v).
caballoBlanco(k).
caballoBlanco(k2).
caballoNegro(k3).
casilla(v,1,1).
casilla(v,1,2).
casilla(k2,1,3).
casilla(v,1,4).
casilla(k,2,1).
casilla(v,2,2).
casilla(v,2,3).
casilla(v,2,4).
casilla(v,3,1).
casilla(v,3,2).
casilla(k3,3,3).
casilla(v,3,4).
casilla(v,4,1).
casilla(v,4,2).
casilla(v,4,3).
casilla(v,4,4).