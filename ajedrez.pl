:-use_module(library(clpfd)).
%Rules

piezaBlanca(X):-peonBlanco(X).
piezaBlanca(X):-caballoBlanco(X).
piezaNegra(X):-peonNegro(X).
piezaNegra(X):-caballoNegro(X).

%Mover peon 1 espacio hacia adelante
mover(Peon,Xo,Yo,Xf,Yf):-
	peonBlanco(Peon),
	casilla(v,Xf,Yf),
	Xf =:= Xo,
	Yf is Yo + 1.

%Mover peon 2 espacios hacia adelante, solo se puede hacer en el movimiento inicial (Yo =:= 2)
mover(Peon,Xo,Yo,Xf,Yf):-
	peonBlanco(Peon),
	Aux #= Yf -1,
	casilla(v,Xf,Aux),
	casilla(v,Xf,Yf),
	Yo =:= 2,
	Xf =:= Xo,
	Yf is Yo + 2.

%Mover peon 1 espacio diagonal izquierda
mover(Peon,Xo,Yo,Xf,Yf):-
	peonBlanco(Peon),
	piezaNegra(N),
	casilla(N,Xf,Yf),
	Xf is Xo+1,
	Yf is Yo+1.

%mover peon 1 espacio diagonal derecha
mover(Peon,Xo,Yo,Xf,Yf):-
	peonBlanco(Peon),
	peonNegro(N),
	casilla(N,Xf,Yf),
	Xf is Xo-1,
	Yf is Yo+1.


%peones negros

%Mover peon 1 espacio hacia adelante
mover(Peon,Xo,Yo,Xf,Yf):-
	peonNegro(Peon),
	casilla(v,Xf,Yf),
	Xf =:= Xo,
	Yf is Yo - 1.

%Mover peon 2 espacios hacia adelante, solo se puede hacer en el movimiento inicial (Yo =:= 2)
mover(Peon,Xo,Yo,Xf,Yf):-
	peonNegro(Peon),
	casilla(v,Xf,Yf-1),
	casilla(v,Xf,Yf),
	Yo =:= 7,
	Xf =:= Xo,
	Yf is Yo - 2.

%Mover peon 1 espacio diagonal izquierda
mover(Peon,Xo,Yo,Xf,Yf):-
	peonNegro(Peon),
	piezaBlanca(N),
	casilla(N,Xf,Yf),
	Xf is Xo+1,
	Yf is Yo-1.

%mover peon 1 espacio diagonal derecha
mover(Peon,Xo,Yo,Xf,Yf):-
	peonNegro(Peon),
	piezaBlanca(N),
	casilla(N,Xf,Yf),
	Xf is Xo-1,
	Yf is Yo-1.



%Caballos

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
peonBlanco(pb1).
peonBlanco(pb2).
peonNegro(pn1).
peonNegro(pn2).
caballoBlanco(kb).
caballoNegro(kn).
casilla(v,1,1).
casilla(pb1,1,2).
casilla(v,1,3).
casilla(v,1,4).
casilla(v,1,5).
casilla(k,2,1).
casilla(pb2,2,2).
casilla(v,2,3).
casilla(pn1,2,4).
casilla(v,2,5).
casilla(v,3,1).
casilla(v,3,2).
casilla(pn2,3,3).
casilla(v,3,4).
casilla(v,3,5).
casilla(kb,4,1).
casilla(v,4,2).
casilla(kn,4,3).
casilla(v,4,4).
casilla(v,4,5).
casilla(v,5,1).
casilla(v,5,2).
casilla(v,5,3).
casilla(v,5,4).
casilla(v,5,5).



