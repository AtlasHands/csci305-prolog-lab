% Keefer Sands
% CSCI 305 Prolog Lab 2

%basic familial relations
mother(M,C):- parent(M,C), female(M).
father(F,C):- parent(F,C), male(F).
spouse(M,F):- married(M,F).
spouse(M,F):- married(F,M).
child(C,P):- parent(P,C).
son(S,P):- parent(P,S),male(S).
daughter(D,P) :- parent(P,D),female(D).
sibling(S,SI) :- father(P,S),father(P,SI),not(S=SI).
brother(B,K) :- father(P,B),father(P,K),male(B),not(B=K).
sister(S,K) :- father(P,S),father(P,K),female(S),not(S=K).

%blood uncle, directly related nonmarriage uncles
uncle(U,K) :- father(P,K),brother(U,P).
uncle(U,K) :- mother(P,K),brother(U,P).
%marriage uncle, person K maried X then X has the same uncle that X has
uncle(U,K) :- married(K,X),father(P,X),brother(U,P).
uncle(U,K) :- married(K,X),mother(P,X),brother(U,P).

%blood uncle, directly related nonmarriage uncles
aunt(U,K) :- father(P,K),sister(U,P).
aunt(U,K) :- mother(P,K),sister(U,P).
%marriage uncle, person K maried X then X has the same uncle that X has
aunt(U,K) :- married(K,X),father(P,X),sister(U,P).
aunt(U,K) :- married(K,X),mother(P,X),sister(U,P).

%grandparent/father using parent of parent scheme/mother of parent, father of parent
grandparent(GP,C) :- parent(P,C),parent(GP,P).
grandfather(GF,C) :- parent(P,C),father(GF,P).
grandmother(GM,C) :- parent(P,C),mother(GM,P).
grandchild(C,GP) :- grandparent(GP,C).

%Ancestor, if A is a parent of B then the test is true, then recursion is used to go up the line
ancestor(A, B) :- parent(A, B).
ancestor(A, B) :- parent(A, X), ancestor(X, B).

%Same as ancestor but backwards, could have also just done decendant(A,B) :- ancestor(B,A).
descendant(A, B) :- parent(B, A).
descendant(A, B) :- parent(B, X), ancestor(X, A).

%older, checks age of both then compares them.
older(O,Y) :- born(O,X),born(Y,Z),X<Z.
younger(Y,O) :- older(O,Y).

%checks the range of reign and checks if they were born in between them
regentWhenBorn(Regent,X) :- born(X,Date),reigned(Regent,Start,End),Start =< Date, Date =< End.
%Checks that parent1 and parent2 are siblings, if they are then the kids are cousins
cousin(X,Y) :- parent(P1,X),parent(P2,Y),sibling(P1,P2),not(P1=P2),not(X=Y).
