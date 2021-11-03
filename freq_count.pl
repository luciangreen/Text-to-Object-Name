% a(M),writeln(M).
% bbb is ""
a(M) :-
A=[[a,b],[c,bbb]],findall(B,(member([C,D],A),(D=bbb->B=C;B=D)),F),sort(F,G),findall([L,J],(member(J,G),findall(J,member(J,F),K),length(K,L)),M1),sort(M1,M).