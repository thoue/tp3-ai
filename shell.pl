:- dynamic fait/1.

:-  op(800, fx, si),
    op(700, xfx, alors),
    op(300, xfy, ou),
    op(200, xfy, et).

% Base de règles
si occasion(seul) alors taille_du_groupe(1).
si occasion(couple) alors taille_du_groupe(2).
si occasion(famille) et enfant(oui) alors genres([aventure, comedie, animation]).
si occasion(famille) et enfant(non) alors genres([action, western, thriller, sci_fi, horreur, guerre, fantaisie, famille, drame, crime, comedie, biographie, aventure, animation]).
si occasion(couple) alors genres([romance, horreur]).
si occasion(seul) ou occasion(couple) alors enfant(non).
si occasion(seul) ou occasion(amis) alors genre([action, western, thriller, sci_fi, horreur, guerre, fantaisie, famille, drame, crime, comedie, biographie, aventure, animation, romance]).
si aime_vieux_films(oui) alors plus_petit_que_année_2000(oui). 
si aime_vieux_films(non) alors plus_petit_que_année_2000(non).
si enfant(oui) ou taille_du_groupe(X) et (X > 5) alors langue_film(francais).
si enfant(non) et taille_du_groupe(X) et (X < 5) alors langue_film(anglais).
si langue_film(francais) alors cinema([limoilou, ste_foy]).
si langue_film(anglais) alors cinema([beauport]).
si enfant(oui) alors cote_film([g, pg, pg13]).
si enfant(oui) alors heures([am, pm]).
si enfant(non) alors cote_film([g, pg, pg13, r]).
si enfant(non) alors heures([pm, soir]).
si budget(X) et (X > 7.50) et (X < 10) alors journee([mardi]).
si budget(X) et (X >= 10) et bon_ou_mauvais(bon) alors journee([vendredi, samedi, dimanche]).
si budget(X) et (X >= 10) et bon_ou_mauvais(mauvais) alors journee([lundi, mercredi, jeudi]).
si budget(X) et (X < 12.25) alors collation(aucun).
si budget(X) et (X >= 12.25) et (X < 14.75) alors collation(combo1).
si budget(X) et (X >= 14.75) alors collation(combo2).

% Chainage avant
ch_avant :- 
    si COND alors X,
    not(fait(X)),
    condition_vraie(COND),
    !,
    %write('nouveau fait : '), write(X),nl,
    asserta(fait(X)),
    ch_avant.
ch_avant.

condition_vraie(C):- fait(C).
condition_vraie(C1 et C2):- condition_vraie(C1), condition_vraie(C2).
condition_vraie(C1 ou C2):- condition_vraie(C1) ; condition_vraie(C2).
condition_vraie(A > B):- eval_expr(A, EvalA), eval_expr(B, EvalB), EvalA > EvalB.
condition_vraie(A < B):- eval_expr(A, EvalA), eval_expr(B, EvalB), EvalA < EvalB.
condition_vraie(A >= B):- eval_expr(A, EvalA), eval_expr(B, EvalB), EvalA >= EvalB.
condition_vraie(A =< B):- eval_expr(A, EvalA), eval_expr(B, EvalB), EvalA =< EvalB.

eval_expr(A, A):- number(A), !. 
eval_expr(A, Eval):- fait(A), !, Eval = A.

% Chainage arrière
ch_arriere(X):- est_vrai(X).

est_vrai(X):- fait(X).
est_vrai(X):- si COND alors X, est_vrai(COND).
est_vrai( C1 et C2 ):- est_vrai(C1), est_vrai(C2).
est_vrai( C1 ou C2 ):- est_vrai(C1) ; est_vrai(C2).