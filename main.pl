:- use_module(library(readutil)).

% Importe la knowledge base
:- consult('knowledge_base.pl').
:- consult('utility.pl').

:- dynamic occasion/1. % Permet de déclarer une occasion comme étant sélectionnée.
:- dynamic enfant/1. % Permet de déclarer si des enfants sont présents dans le groupe.
:- dynamic taille_du_groupe/1. % Permet de déclarer la taille du groupe. 
:- dynamic aime_vieux_films/1. % Permet de déclarer si le groupe aime les vieux films ou non
:- dynamic bon_ou_mauvais/1. % Permet de déclarer si le groupe veut voir un film de qualité ou médiocre.
:- dynamic budget/1. % Permet de déclarer le budget par personne.

:- dynamic genres/1.
:- dynamic plus_petit_que_année_2000/1.
:- dynamic journee/1.
:- dynamic langue_film/1.
:- dynamic cinema/1.
:- dynamic cote_film/1.
:- dynamic heures/1.
:- dynamic collation/1.

cls :- 
    write('\33\[2J'),
    write('\e[2J').

handle_occasion_question :- 
    write('Pour quelle occasion venez-vous au cinema?'), nl, nl,
    write_occasion(1, 'En famille'),
    write_occasion(2, 'En couple'),
    write_occasion(3, 'Entre amis'),
    write_occasion(4, 'Seul'),
    typewriter_write('Veuillez choisir un numéro correspondant à une occasion:'), nl,
    read(Occasion),
    cls,
    (Occasion < 1 ; Occasion > 4 -> 
        handle_occasion_question
    ; 
        (retractall(occasion(_)), assert(occasion(Occasion))),
        (Occasion = 2 -> 
            retractall(enfant(_)), assert(enfant(2)),
            retractall(taille_du_groupe(_)), assert(taille_du_groupe(2)),
            handle_aime_vieux_films_question
        ; 
        Occasion = 4 -> 
            retractall(enfant(_)), assert(enfant(2)),
            retractall(taille_du_groupe(_)), assert(taille_du_groupe(1)),
            handle_aime_vieux_films_question
        ; 
            handle_enfant_question
        )
    ).

handle_occasion_question :- 
    write('Pour quelle occasion venez-vous au cinema?'), nl, nl,
    write_occasion(1, 'En famille'),
    write_occasion(2, 'En couple'),
    write_occasion(3, 'Entre amis'),
    write_occasion(4, 'Seul'),
    typewriter_write('Veuillez choisir un numéro correspondant à une occasion:'), nl,
    read(Occasion),
    cls,
    (Occasion < 1 ; Occasion > 4 -> 
        handle_occasion_question
    ; 
        (retractall(occasion(_)), assert(occasion(Occasion))),
        (Occasion = 2 -> 
            retractall(enfant(_)), assert(enfant(2)),
            retractall(taille_du_groupe(_)), assert(taille_du_groupe(2)),
            handle_aime_vieux_films_question
        ; 
        Occasion = 4 -> 
            retractall(enfant(_)), assert(enfant(2)),
            retractall(taille_du_groupe(_)), assert(taille_du_groupe(1)),
            handle_aime_vieux_films_question
        ; 
            handle_enfant_question
        )
    ).

handle_enfant_question :- 
    write('Est-ce qu\'il y a des enfants dans le groupe?'), nl, nl,
    write_enfant(1, 'Oui'),
    write_enfant(2, 'Non'),
    typewriter_write('Veuillez choisir un numéro correspondant à une réponse:'), nl,
    read(Enfant),
    cls,
    (Enfant < 1 ; Enfant > 2 -> 
        handle_enfant_question
    ; 
        (retractall(enfant(_)), assert(enfant(Enfant))),
        handle_taille_du_groupe_question
    ).

handle_taille_du_groupe_question :- 
    write('Combien de personnes serez-vous?'), nl,
    write('Veuillez entrer un nombre de personnes:'), nl,
    read(GroupSize),
    (GroupSize < 1 -> 
        write('Erreur: Veuillez entrer un nombre valide de personnes. ( > 0 )'), nl,
        handle_taille_du_groupe_question
    ;
    assert(taille_du_groupe(GroupSize)),
    cls,
    handle_aime_vieux_films_question
    ).

handle_aime_vieux_films_question :- 
    write('Aimez-vous les vieux films?'), nl, nl,
    write_aime_vieux_films(1, 'Oui'),
    write_aime_vieux_films(2, 'Non'),
    typewriter_write('Veuillez choisir un numéro correspondant à une réponse:'), nl,
    read(LikeOldMovies),
    cls,
    (LikeOldMovies < 1 ; LikeOldMovies > 2 -> 
        handle_aime_vieux_films_question
    ;
        (retractall(aime_vieux_films(_)), assert(aime_vieux_films(LikeOldMovies))),
        handle_bon_ou_mauvais_question
    ).

handle_bon_ou_mauvais_question :- 
    write('Voulez-vous voir un film de qualité ou médiocre?'), nl, nl,
    write_bon_ou_mauvais(1, 'Qualité'),
    write_bon_ou_mauvais(2, 'Médiocre'),
    typewriter_write('Veuillez choisir un numéro correspondant à une réponse:'), nl,
    read(GoodOrBad),
    cls,
    (GoodOrBad < 0 ; GoodOrBad > 2 -> 
        handle_bon_ou_mauvais_question
    ;
        (retractall(bon_ou_mauvais(_)), assert(bon_ou_mauvais(GoodOrBad))),
        handle_budget_question
    ).

handle_budget_question :- 
    write('Quel est votre budget pour la sortie au cinema?'), nl,
    write('Veuillez entrer un montant en dollars:'), nl,
    read(Budget),
    (Budget < 0 -> 
        write('Erreur: Veuillez entrer un montant valide en dollars. ( > 0 )'), nl,
        handle_budget_question
    ;
    assert(budget(Budget)),
    cls,
    give_results
    ).

give_results :-
    write('Prints results here'), nl,
    true.

write_occasion(Num, Occasion) :- 
    typewriter_write(Num), write('. '), typewriter_write(Occasion), nl.

write_enfant(Num, Enfant) :- 
    typewriter_write(Num), write('. '), typewriter_write(Enfant), nl.

write_aime_vieux_films(Num, ClassicOrNewer) :- 
    typewriter_write(Num), write('. '), typewriter_write(ClassicOrNewer), nl.

write_bon_ou_mauvais(Num, GoodOrBad) :- 
    typewriter_write(Num), write('. '), typewriter_write(GoodOrBad), nl.

write_budget(Budget) :- 
    typewriter_write('Votre budget est de '), typewriter_write(Budget), typewriter_write('$'), nl.

clear_all_facts :- 
    retractall(occasion(_)),
    retractall(enfant(_)),
    retractall(taille_du_groupe(_)),
    retractall(aime_vieux_films(_)),
    retractall(bon_ou_mauvais(_)),
    retractall(budget(_)).

% Interface principal
start_ui :- 
    cls,
    typewriter_write('Bienvenue dans le système de planification de sortie au cinema!'), nl,
    typewriter_write('Veuillez répondre aux questions suivantes pour obtenir des recommandations de films.'), nl,
    
    nl, typewriter_write('(Appuyez sur une touche pour continuer...)'), nl,
    get_single_char(_),

    cls,
    typewriter_write('\n Quel est votre nom?'), nl,
    read_line_to_string(user_input, Name),

    cls,
    typewriter_write('Bonjour '), typewriter_write(Name), nl,
    nl, write('(Appuyez sur une touche pour continuer...)'), nl,
    get_single_char(_),

    handle_occasion_question.

:- clear_all_facts.
:- start_ui.