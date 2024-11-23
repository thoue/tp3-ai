%Importe la knowledge base
:- consult('knowledge_base.pl').
:- consult('utility.pl').

%Interface principal
start_ui :-
    write('Bienvenue dans le système de planification de sortie au cinema!'), nl,
    write('Veuillez répondre aux questions suivantes pour obtenir des recommandations de films.'), nl,

    write('Quel est votre nom?'), nl,
    read(Name),
    write('Bonjour '), write(Name), write('!'), nl,

    write('Quelles jours de la semaine etes-vous disponible?'), nl,
    read(Days), % a implementer ajouter la loop pour les jours

    write('Quelles sont les heures qui vous conviennent?'), nl,
    read(Hours), % a implementer ajouter la loop pour les heures selon les journees disponibles

    write('Quel genre de film preferez-vous aller voir?'), nl,
    read(Genre), % a implementer ajouter la loop pour les genres

    write('Quel est votre budget pour la sortie au cinema?'), nl,
    read(Budget),

    write('Dans quel cinema preferez-vous aller?'), nl,
    read(Theater), % a implementer ajouter la loop pour les cinemas

    write('Voulez-vous des collations?'), nl,
    read(Snacks), % a implementer ajouter la loop pour les collations (yes/no)

    write('Voulez-vous voir un film mediocre ou seulement les meilleurs?'), nl,
    read(MinRating), % a implementer ajouter la loop pour le rating (1 = mediocre, 2= meilleur)

    write('Quel acteur preferez-vous?'Ex: Brad Pitt), nl,
    read(Actor), 

start_ui.