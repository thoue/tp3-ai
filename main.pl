:- use_module(library(readutil)).

% Importe les films et la coquille
:- consult('movies.pl').
:- consult('shell.pl').

end_question :-
    true.

%Fonctions d'occasion
occasion_mapping(1, famille).
occasion_mapping(2, couple).
occasion_mapping(3, amis).
occasion_mapping(4, seul).

handle_occasion_question :- 
    write('Question : Pour quelle occasion venez-vous au cinema?'), nl,
    write_occasion(1, 'En famille'),
    write_occasion(2, 'En couple'),
    write_occasion(3, 'Entre amis'),
    write_occasion(4, 'Seul'),
    write('Veuillez choisir un numéro correspondant à une occasion:'), nl,
    read(Occasion),
    nl, nl,
    (Occasion < 1 ; Occasion > 4 -> 
        write('Veuillez entrer un des choix proposés...'), nl,
        handle_occasion_question
    ; 
        occasion_mapping(Occasion, OccasionText),
        (retractall(occasion(_)), asserta(fait(occasion(OccasionText)))),
        (OccasionText = couple -> 
            handle_aime_vieux_films_question
        ; 
        OccasionText = seul -> 
            handle_aime_vieux_films_question
        ; 
            handle_enfant_question
        )
    ).

%Fonctions d'enfant
enfant_mapping(1, oui).
enfant_mapping(2, non).

handle_enfant_question :- 
    write('Question : Est-ce qu\'il y a des enfants dans le groupe?'), nl,
    write_enfant(1, 'Oui'),
    write_enfant(2, 'Non'),
    write('Veuillez choisir un numéro correspondant à une réponse suivi d\'un point:'), nl,
    read(Enfant),
    nl, nl,
    enfant_mapping(Enfant, EnfantText),
    (Enfant < 1 ; Enfant > 2 -> 
        handle_enfant_question
    ; 
        (retractall(enfant(_)), asserta(fait(enfant(EnfantText)))),
        handle_taille_du_groupe_question
    ).

handle_taille_du_groupe_question :- 
    write('Question : Combien de personnes serez-vous?'), nl,
    write('Veuillez entrer un nombre de personnes suivi d\'un point:'), nl,
    read(GroupSize),
    (GroupSize < 1 -> 
        write('Erreur: Veuillez entrer un nombre valide de personnes. ( > 0 )'), nl,
        handle_taille_du_groupe_question
    ;
    asserta(fait(taille_du_groupe(GroupSize))),
    nl, nl,
    handle_aime_vieux_films_question
    ).

%Fonctions d'aime_vieux_films
vieux_films_mapping(1, oui).
vieux_films_mapping(2, non).

handle_aime_vieux_films_question :- 
    write('Question : Aimez-vous les vieux films?'), nl,
    write_aime_vieux_films(1, 'Oui'),
    write_aime_vieux_films(2, 'Non'),
    write('Veuillez choisir un numéro correspondant à une réponse suivi d\'un point:'), nl,
    read(LikeOldMovies),
    nl, nl,
    vieux_films_mapping(LikeOldMovies, LikeOldMoviesText),
    (LikeOldMovies < 1 ; LikeOldMovies > 2 -> 
        handle_aime_vieux_films_question
    ;
        asserta(fait(aime_vieux_films(LikeOldMoviesText))),
        handle_budget_question
    ).

%Fonctions de bon_ou_mauvais
bon_ou_mauvais_mapping(1, bon).
bon_ou_mauvais_mapping(2, mauvais).

handle_bon_ou_mauvais_question :- 
    write('Question : Voulez-vous voir un film de qualité ou médiocre?'), nl,
    write_bon_ou_mauvais(1, 'Qualité'),
    write_bon_ou_mauvais(2, 'Médiocre'),
    write('Veuillez choisir un numéro correspondant à une réponse suivi d\'un point:'), nl,
    read(GoodOrBad),
    nl, nl,
    bon_ou_mauvais_mapping(GoodOrBad, GoodOrBadText),
    (GoodOrBad < 0 ; GoodOrBad > 2 -> 
        handle_bon_ou_mauvais_question
    ;
        (retractall(bon_ou_mauvais(_)), asserta(fait(bon_ou_mauvais(GoodOrBadText))))
    ).

handle_budget_question :- 
    write('Quel est votre budget pour la sortie au cinema?'), nl,
    write('Veuillez entrer un montant en dollars sans décimales suivi d\'un point:'), nl,
    read(Budget),
    nl, nl,
    (Budget < 0 -> 
        write('Erreur: Veuillez entrer un montant valide en dollars. ( > 0 )'), nl,
        handle_budget_question
    ;
        asserta(fait(budget(Budget))),
        (Budget > 9 -> 
            handle_bon_ou_mauvais_question
        ; 
            true
        )
    ).

write_occasion(Num, Occasion) :- 
    write(Num), write('. '), write(Occasion), nl.

write_enfant(Num, Enfant) :- 
    write(Num), write('. '), write(Enfant), nl.

write_aime_vieux_films(Num, ClassicOrNewer) :- 
    write(Num), write('. '), write(ClassicOrNewer), nl.

write_bon_ou_mauvais(Num, GoodOrBad) :- 
    write(Num), write('. '), write(GoodOrBad), nl.

write_budget(Budget) :- 
    write('Votre budget est de '), write(Budget), write('$'), nl.

clear_all_facts :- 
    retractall(fait(_)).

% Interface principal
start_questions :- 
    clear_all_facts,
    nl, nl,
    write('Bienvenue dans le système de planification de sortie au cinema!'), nl,
    write('Veuillez répondre aux questions suivantes pour obtenir des recommandations de films.'), nl,
    
    nl, write('(Appuyez sur la touche espace pour continuer...)'), nl,
    get_single_char(_),

    nl, nl,

    handle_occasion_question,
    find_movies_and_show.

afficher_films([]).
afficher_films([(Titre, Cinema, Genre, Cote, Heures, Annee, JourneeDispo) | Rest]) :-
    format('Titre: ~w~n', [Titre]),
    format('Cinéma: ~w~n', [Cinema]),
    format('Genre: ~w~n', [Genre]),
    format('Cote: ~w~n', [Cote]),
    format('Heures: ~w~n', [Heures]),
    format('Année de sortie: ~w~n', [Annee]),
    format('Jours de projection: ~w~n', [JourneeDispo]),
    format('---------------------------~n'),
    afficher_films(Rest).

find_movies_and_show :- 
    ch_avant,

    fait(cinema(CinemaList)),
    fait(genres(GenresList)),
    fait(cote_film(CoteList)),
    fait(heures(HeuresList)),
    fait(plus_petit_que_année_2000(OldMovies)),
    fait(journee(JourneeList)),

    fait(collation(Collation)),

    findall((Titre, Cinema, Genre, Cote, Heures, Annee, JourneeInter), (
        movie(Titre, Cinema, Genre, Cote, Heures, Annee, JourneeDispo),
        member(Cinema, CinemaList),
        member(Genre, GenresList),
        member(Cote, CoteList),
        member(Heures, HeuresList),
        (OldMovies = oui -> Annee < 2000 ; Annee >= 2000),
        intersection(JourneeList, JourneeDispo, JourneeInter),
        JourneeInter \= []
    ), FilmFiltre),

    snack(Collation, Description, Prix),
    
    write('Voici les recommandations'), nl, nl,
    write('Collation incluse : '), write(Description), write('  -  '), write(Prix), write(' $'), nl, 
    format('---------------------------~n'),
    afficher_films(FilmFiltre).