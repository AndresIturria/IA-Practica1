/*
Copyright [2020] [Andres Eduardo Iturria Soler]
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at
http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

%Rules

pieza(X):-peon(X).
pieza(X):-caballo(X).


%Puede ser útil para extender el programa en el futuro.
/* siguienteRectoArriba(casilla(Pieza, X, Y), X, Yn) :-
   pieza(Pieza),
   color(Pieza, blanco),
   Yn =:= Y + 1. 

siguienteRectoArriba(casilla(Pieza, X, Y), X, Yn) :-
   pieza(Pieza),
   color(Pieza, negro),
   Yn =:= Y - 1.  */


%Peones Blancos.
%Mover peon 1 espacio hacia adelante
mover(Peon,Xo,Yo,Xo,Yf):-
	peon(Peon),
	color(Peon, blanco),
	casilla(Peon, Xo, Yo),
	casilla(v,Xo,Yf),
	Yf =:= Yo + 1.

%Mover peon 2 espacios hacia adelante, solo se puede hacer en el movimiento inicial (Yo =:= 2)
mover(Peon,Xo,2,Xo,4):-
	peon(Peon),
	color(Peon, blanco),
	casilla(Peon, Xo, 2),
	casilla(v,Xo,3),
	casilla(v,Xo,4).


%Mover peon 1 espacio diagonal izquierda
mover(Peon,Xo,Yo,Xf,Yf):-
	peon(Peon),
	color(Peon, blanco),
	casilla(Peon, Xo, Yo),
	pieza(N),
	color(N, negro),
	casilla(N,Xf,Yf),
	Xf =:= Xo+1,
	Yf =:= Yo+1.

%mover peon 1 espacio diagonal derecha
mover(Peon,Xo,Yo,Xf,Yf):-
	peon(Peon),
	color(Peon, blanco),
	casilla(Peon, Xo, Yo),
	peon(N),
	color(N, negro),
	casilla(N,Xf,Yf),
	Xf =:= Xo-1,
	Yf =:= Yo+1.


%Peones negros

%Mover peon 1 espacio hacia adelante
mover(Peon,Xo,Yo,Xo,Yf):-
	peon(Peon),
	color(Peon, negro),
	casilla(Peon, Xo, Yo),
	casilla(v,Xo,Yf),
	Yf =:= Yo - 1.

%Mover peon 2 espacios hacia adelante, solo se puede hacer en el movimiento inicial (Yo =:= 7)
mover(Peon,Xo,7,Xo,5):-
	peon(Peon),
	color(Peon, negro),
	casilla(Peon,Xo,7),
	casilla(v,Xo,6),
	casilla(v,Xo,5).

%Mover peon 1 espacio diagonal izquierda
mover(Peon,Xo,Yo,Xf,Yf):-
	peon(Peon),
	color(Peon, negro),
	casilla(Peon, Xo, Yo),
	pieza(N),
	color(N, blanco),
	casilla(N, Xf, Yf),
	Xf =:= Xo+1,
	Yf =:= Yo-1.

%mover peon 1 espacio diagonal derecha
mover(Peon,Xo,Yo,Xf,Yf):-
	peon(Peon),
	color(Peon, negro),
	casilla(Peon, Xo, Yo),
	pieza(N),
	color(N,blanco),
	casilla(N,Xf,Yf),
	Xf =:= Xo-1,
	Yf =:= Yo-1.



%Caballos

%Caballos blancos

%Mover 2 espacios en vertical y uno horizontal.

mover(K,Xo,Yo,Xf,Yf):-
	caballo(K),
	color(K, blanco),
	casilla(K,Xo,Yo),
	(casilla(v,Xf,Yf) ; pieza(X), color(X,negro), casilla(X,Xf,Yf)),
	(Xf =:= Xo + 1 ; Xf =:= Xo -1),
	(Yf =:= Yo + 2 ; Yf =:= Yo -2).

%Mover 2 espacios en horizontal y uno en vertical.
mover(K,Xo,Yo,Xf,Yf):-
	caballo(K),
	color(K, blanco),
	casilla(K,Xo,Yo),
	(casilla(v,Xf,Yf) ; pieza(X), color(X,negro), casilla(X,Xf,Yf)),
	(Xf is Xo + 2 ; Xf is Xo -2),
	(Yf is Yo + 1 ; Yf is Yo -1).

%Caballos Negros

%Mover 2 espacios en vertical y uno horizontal.
mover(K,Xo,Yo,Xf,Yf):-
	caballo(K),
	color(K,negro),
	casilla(K,Xo,Yo),
	(casilla(v,Xf,Yf) ; pieza(X), color(X,blanco), casilla(X,Xf,Yf)),
	(Xf =:= Xo + 1 ; Xf =:= Xo -1),
	(Yf =:= Yo + 2 ; Yf =:= Yo -2).

%Mover 2 espacios en horizontal y uno en vertical.
mover(K,Xo,Yo,Xf,Yf):-
	caballo(K),
	color(K,negro),
	casilla(K,Xo,Yo),
	(casilla(v,Xf,Yf) ; pieza(X), color(X,blanco), casilla(X,Xf,Yf)),
	(Xf =:= Xo + 2 ; Xf =:= Xo -2),
	(Yf =:= Yo + 1 ; Yf =:= Yo -1).

%facts

vacio(v).

peon(pb1).
peon(pb2).
peon(pn1).
peon(pn2).

caballo(kb).
caballo(kn).

color(pb1, blanco).
color(pb2, blanco).
color(pn1, negro).
color(pn2, negro).
color(kb, blanco).
color(kn, negro).

casilla(v,1,1).
casilla(pb1,1,2).
casilla(v,1,3).
casilla(v,1,4).
casilla(v,1,5).
casilla(v,2,1).
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




