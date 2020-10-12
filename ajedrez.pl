%rules

peon(X):-peon_blanco(X).
peon(X):-peon_negro(X).







%facts
peon_blanco(p1).
peon_blanco(p2).
peon_negro(p3).
casilla_ocupada(p1,1,2).
casilla_ocupada(p2,1,4).
casilla_ocupada(p3,2,3).