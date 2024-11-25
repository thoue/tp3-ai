%Importe la knowledge base
:- consult('knowledge_base.pl').
:- consult('utility.pl').

:- dynamic available_days/1. % Permet de déclarer un jour de la semaine comme étant disponible

% Jour de la semaine
weekday(1, 'Lundi').
weekday(2, 'Mardi').
weekday(3, 'Mercredi').
weekday(4, 'Jeudi').
weekday(5, 'Vendredi').
weekday(6, 'Samedi').
weekday(7, 'Dimanche').

cls :- 
    write('\33\[2J'),
    write('\e[2J').

handle_weekdays_question :-
    write('Quelles jours de la semaine êtes-vous disponible?'), nl, nl,
    write_day(1, 'Lundi'),
    write_day(2, 'Mardi'),
    write_day(3, 'Mercredi'),
    write_day(4, 'Jeudi'),
    write_day(5, 'Vendredi'),
    write_day(6, 'Samedi'),
    write_day(7, 'Dimanche'),
    typewriter_write('0. Question suivante'), nl,
    typewriter_write('Veuillez choisir un numéro correspondant à un jour de la semaine:'), nl,
    read(Day),
    cls,
    (Day < 0 ; Day > 7 -> 
        true
    ; 
        (Day \= 0 ->
            (available_days(Day) -> 
                retract(available_days(Day))
            ;   
                assert(available_days(Day))),
            handle_weekdays_question
        ; 
            true
        )
    ).

write_day(Number, DayName) :-
    typewriter_write(Number), typewriter_write('. '), typewriter_write(DayName),
    (available_days(Number) -> typewriter_write(' \033[32m(Déjà sélectionné)\033[0m') ; true), nl.

%Interface principal
start_ui :-
    cls,
    typewriter_write('Bienvenue dans le système de planification de sortie au cinema!'), nl,
    typewriter_write('Veuillez répondre aux questions suivantes pour obtenir des recommandations de films.'), nl,
    
    nl, typewriter_write('(Appuyez sur une touche pour continuer...)'), nl,
    get_single_char(_),

    cls,
    typewriter_write('\n Quel est votre nom?'), nl,
    read(Name),

    cls,
    typewriter_write('Bonjour '), typewriter_write(Name), typewriter_write('!'), nl,
    nl, write('(Appuyez sur une touche pour continuer...)'), nl,

    handle_weekdays_question.

    % write('Quelles sont les heures qui vous conviennent?'), nl,
    % read(_), % a implementer ajouter la loop pour les heures selon les journees disponibles

    % write('Quel genre de film préférez-vous aller voir?'), nl,
    % read(_), % a implementer ajouter la loop pour les genres

    % write('Quel est votre budget pour la sortie au cinema?'), nl,
    % read(_),

    % write('Dans quel cinema preferez-vous aller?'), nl,
    % read(_), % a implementer ajouter la loop pour les cinemas

    % write('Voulez-vous des collations?'), nl,
    % read(_), % a implementer ajouter la loop pour les collations (yes/no)

    % write('Voulez-vous voir un film mediocre ou seulement les meilleurs?'), nl,
    % read(_), % a implementer ajouter la loop pour le rating (1 = mediocre, 2= meilleur)

    % write('Quel acteur preferez-vous? Ex: Brad Pitt'), nl,
    % read(_).

clear_all_facts :-
    retractall(available_days(_)).

:- clear_all_facts.
:- start_ui.