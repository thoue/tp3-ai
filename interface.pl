%Importe la knowledge base
:- consult('knowledge_base.pl').
:- consult('utility.pl').

:- dynamic available_days/1. % Permet de déclarer un jour de la semaine comme étant disponible
:- dynamic available_hours/1. % Permet de déclarer une plage horaire comme étant disponible
:- dynamic available_genres/1. % Permet de déclarer un genre de film comme étant disponible

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

handle_schedule_question :-
    write('Quelle(s) plage(s) horaire(s) vous convient?'), nl, nl,
    write_schedule(1, 'AM'),
    write_schedule(2, 'PM'),
    write_schedule(3, 'Soir'),
    typewriter_write('0. Question suivante'), nl,
    typewriter_write('Veuillez choisir un numéro correspondant à une plage horaire:'), nl,
    read(Hours),
    cls,
    (Hours < 0 ; Hours > 3 -> 
        true
    ;
        (Hours \= 0 ->
            (available_hours(Hours) -> 
                retract(available_hours(Hours))
            ;   
                assert(available_hours(Hours))),
            handle_schedule_question
        ; 
            true
        )
    ).

handle_genre_question :-
    write('Quel(s) genre(s) de film préférez-vous aller voir?'), nl, nl,
    write_genre(1, 'Action'),
    write_genre(2, 'Drame'),
    write_genre(3, 'Crime'),
    write_genre(4, 'Western'),
    write_genre(5, 'Horreur'),
    write_genre(6, 'Animation'),
    write_genre(7, 'Biographie'),
    write_genre(8, 'Comédie'),
    write_genre(9, 'Musical'),
    write_genre(10, 'Thriller'),
    write_genre(11, 'Sci-Fi'),
    write_genre(12, 'Famille'),
    write_genre(13, 'Fantaisie'),
    write_genre(14, 'Romance'),
    write_genre(15, 'Aventure'),
    typewriter_write('0. Question suivante'), nl,
    typewriter_write('Veuillez choisir un numéro correspondant à un genre de film:'), nl,
    read(Genre),
    cls,
    (Genre < 0 ; Genre > 15 -> 
        true
    ;   
        (Genre \= 0 ->
            (available_genres(Genre) -> 
                retract(available_genres(Genre))
            ;   
                assert(available_genres(Genre))),
            handle_genre_question
        ; 
            true
        )
    ).

handle_budget_question :-
    write('Quel est votre budget pour la sortie au cinema?'), nl,
    write('Veuillez entrer un montant en dollars:'), nl,
    read(Budget),
    cls.

write_day(Number, DayName) :-
    typewriter_write(Number), typewriter_write('. '), typewriter_write(DayName),
    (available_days(Number) -> typewriter_write(' \033[32m(Déjà sélectionné)\033[0m') ; true), nl.

write_schedule(Number, ScheduleName) :-
    typewriter_write(Number), typewriter_write('. '), typewriter_write(ScheduleName),
    (available_hours(Number) -> typewriter_write(' \033[32m(Déjà sélectionné)\033[0m') ; true), nl.

write_genre(Number, GenreName) :-    
    typewriter_write(Number), typewriter_write('. '), typewriter_write(GenreName),
    (available_genres(Number) -> typewriter_write(' \033[32m(Déjà sélectionné)\033[0m') ; true), nl.

%Interface principal
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

    handle_weekdays_question,
    handle_schedule_question,
    handle_genre_question.
    

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