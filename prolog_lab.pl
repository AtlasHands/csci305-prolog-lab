% Keefer Sands
% CSCI 305 Prolog Lab 2
mother(M,C):- parent(M,C), female(M).
father(F,C):- parent(F,C), male(F).
spouse(M,F):- married(M,F).
child(C,P):- parent(P,C).
son(S,P):- parent(P,S),male(S).
daughter(D,P) :- parent(P,D),female(D).
sibling(S,SI) :- father(P,S),father(P,SI),not(S=SI).
brother(B,K) :- father(P,B),father(P,K),male(B),not(B=K). 
sister(S,K) :- father(P,S),father(P,K),female(S),not(S=K).
bloodUncle(U,K) :- father(P,K),brother(U,P).
bloodUncle(U,K) :- mother(P,K),brother(U,P).
marriageUncle(U,K) :- married(K,X),father(P,X),brother(U,P).
marriageUncle(U,K) :- married(K,X),mother(P,X),brother(U,P).
grandparent(GP,C) :- parent(P,C),parent(GP,P).
grandfather(GF,C) :- parent(P,C),father(GF,P).
grandmother(GM,C) :- parent(P,C),mother(GM,P).
grandchild(C,GP) :- grandparent(GP,C).
ancestor(Decendant,K) :- not( Decendant = K) -> ancestor(parent(P,Decendant),ancestor).