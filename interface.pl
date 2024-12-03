:- use_module(library(readutil)).

% Importe la knowledge base
:- consult('knowledge_base.pl').
:- consult('utility.pl').


:- dynamic occasion/1. % Permet de déclarer une occasion comme étant sélectionnée.
:- dynamic children/1. % Permet de déclarer si des enfants sont présents dans le groupe.
:- dynamic group_size/1. % Permet de déclarer la taille du groupe. 
:- dynamic classic_or_newer/1. % Permet de déclarer si le groupe veut voir un classique ou un nouveau film. 
:- dynamic good_or_bad/1. % Permet de déclarer si le groupe veut voir un film de qualité ou médiocre.
:- dynamic budget/1. % Permet de déclarer le budget par personne.

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
            retractall(children(_)), assert(children(2)),
            retractall(group_size(_)), assert(group_size(2)),
            handle_classic_or_newer_question
        ; 
        Occasion = 4 -> 
            retractall(children(_)), assert(children(2)),
            retractall(group_size(_)), assert(group_size(1)),
            handle_classic_or_newer_question
        ; 
            handle_children_question
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
            retractall(children(_)), assert(children(2)),
            retractall(group_size(_)), assert(group_size(2)),
            handle_classic_or_newer_question
        ; 
        Occasion = 4 -> 
            retractall(children(_)), assert(children(2)),
            retractall(group_size(_)), assert(group_size(1)),
            handle_classic_or_newer_question
        ; 
            handle_children_question
        )
    ).

handle_children_question :- 
    write('Est-ce qu\'il y a des enfants dans le groupe?'), nl, nl,
    write_children(1, 'Oui'),
    write_children(2, 'Non'),
    typewriter_write('Veuillez choisir un numéro correspondant à une réponse:'), nl,
    read(Children),
    cls,
    (Children < 1 ; Children > 2 -> 
        handle_children_question
    ; 
        (retractall(children(_)), assert(children(Children))),
        handle_group_size_question
    ).

handle_group_size_question :- 
    write('Combien de personnes serez-vous?'), nl,
    write('Veuillez entrer un nombre de personnes:'), nl,
    read(GroupSize),
    (GroupSize < 1 -> 
        write('Erreur: Veuillez entrer un nombre valide de personnes. ( > 0 )'), nl,
        handle_group_size_question
    ;
    assert(group_size(GroupSize)),
    cls,
    handle_classic_or_newer_question
    ).

handle_classic_or_newer_question :- 
    write('Voulez-vous voir un classique ou un nouveau film?'), nl, nl,
    write_classic_or_newer(1, 'Classique'),
    write_classic_or_newer(2, 'Nouveauté'),
    typewriter_write('Veuillez choisir un numéro correspondant à une réponse:'), nl,
    read(ClassicOrNewer),
    cls,
    (ClassicOrNewer < 1 ; ClassicOrNewer > 2 -> 
        handle_classic_or_newer_question
    ; 
        (retractall(classic_or_newer(_)), assert(classic_or_newer(ClassicOrNewer))),
        handle_good_or_bad_question
    ).

handle_good_or_bad_question :- 
    write('Voulez-vous voir un film de qualité ou médiocre?'), nl, nl,
    write_good_or_bad(1, 'Qualité'),
    write_good_or_bad(2, 'Médiocre'),
    typewriter_write('Veuillez choisir un numéro correspondant à une réponse:'), nl,
    read(GoodOrBad),
    cls,
    (GoodOrBad < 0 ; GoodOrBad > 2 -> 
        handle_good_or_bad_question
    ;
        (retractall(good_or_bad(_)), assert(good_or_bad(GoodOrBad))),
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

write_children(Num, Children) :- 
    typewriter_write(Num), write('. '), typewriter_write(Children), nl.

write_classic_or_newer(Num, ClassicOrNewer) :- 
    typewriter_write(Num), write('. '), typewriter_write(ClassicOrNewer), nl.

write_good_or_bad(Num, GoodOrBad) :- 
    typewriter_write(Num), write('. '), typewriter_write(GoodOrBad), nl.

write_budget(Budget) :- 
    typewriter_write('Votre budget est de '), typewriter_write(Budget), typewriter_write('$'), nl.

clear_all_facts :- 
    retractall(occasion(_)),
    retractall(children(_)),
    retractall(group_size(_)),
    retractall(classic_or_newer(_)),
    retractall(good_or_bad(_)),
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