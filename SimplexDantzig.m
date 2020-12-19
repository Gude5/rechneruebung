function [ xopt,B,message, iter, Zielfktnswert] = SimplexDantzig( A,b,c,Binit,xB)
%function [ xopt,B ,message, iter] = primalSimplex( A,b,c,Binit,xB )
%
% Primales Simplexverfahren
%
% Input:  A, b, c   - Daten für LP in primaler Standardform
%                      min c'x s.t. Ax=b, x>=0
%         Binit, xB - primal zulaessige Basis, zugehörige Basislösung
%                     (optional)
% Output: xopt      - optimale Lsg
%         B         - zugehörige Basis
%         message   - Information über Optimallösung oder Unbeschraenktheit
%         iter      - Anzahl der Iterationen
%
% Patrick Nowak, Yannick Gläser, Tim Rauch, Ben , DATUM

%checken wir den input:
tol=1e-6
m=size(A,1);
n=size(A,2);
if length(b)~=m || length(c)~=n
    error('A,b,c nicht Dimensionsverträglich')
end
if rank(A)~=m
    error('A hat nicht vollen Zeilenrang')
end
A_Binit=A(:,Binit);
if rank(A_Binit)~=m
    error('Binit ist keine Basis')
elseif any(A_Binit\b<0)
    error('Binit is nicht primal zulaessig')
elseif any(A_Binit\b~=xB)
    error('xB stimmen nicht')
end
% input ist jetzt top

B=Binit;
N=setdiff((1:n),B)
A_B=A_Binit;

%BTRAN
 %loese y'A_B=c_B'
y=(c(B).'/A(:,B)).'

%PRICING
    %berechne z_N=c_N-A_N'*y
z_N=c(N)-A(:,N).'*y




    
% Toleranz Definieren!(siehe Blatt)
% Eingabefehler abfangen
% Initialisierung
% Einzelnen Schritte des Algorithmus:
% (1) BTRAN:  
% (2) Pricing:
% (3) FTRAN:
% (4) Ratiotest:
% (5) Update: