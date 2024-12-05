% Syntax: movie(Title, LeadActor, Rating, Location, Genre, RatingCategory, TimeOfDay, ReleaseYear, DaysOfWeek).

% Liste des jours de la semaine
jours_semaine([lundi, mardi, mercredi, jeudi, vendredi, samedi, dimanche]).

% Movies at Ste-Foy
movie('Avengers: Infinity War', ste_foy, action, pg13, pm, 2018, [lundi, mercredi, vendredi]).
movie('The Pianist', ste_foy, biographie, r, pm, 2002, [mardi, jeudi, samedi]).
movie('Movie 43', ste_foy, comedie, r, am, 2013, [mercredi, vendredi, dimanche]).
movie('The Godfather Part II', ste_foy, crime, r, pm, 1974, [lundi, jeudi, dimanche]).
movie('The Shawshank Redemption', ste_foy, drame, r, pm, 1994, [mardi, mercredi, vendredi]).
movie('The Lord of the Rings: The Return of the King', ste_foy, fantaisie, pg13, pm, 2003, [lundi, jeudi, samedi]).
movie('Coco', ste_foy, animation, pg, pm, 2017, [mardi, vendredi, dimanche]).
movie('Saving Private Ryan', ste_foy, guerre, r, pm, 1998, [lundi, mercredi, dimanche]).
movie('Birdemic: Shock and Terror', ste_foy, horreur, r, am, 2010, [jeudi, vendredi, samedi]).
movie('Fantastic Four', ste_foy, sci_fi, pg13, am, 2005, [mardi, samedi, dimanche]).
movie('The Silence of the Lambs', ste_foy, thriller, r, pm, 1991, [mercredi, vendredi, dimanche]).
movie('Gigli', ste_foy, romance, r, am, 2003, [lundi, jeudi, samedi]).

% Movies at Beauport
movie('Terminator 2: Judgment Day', beauport, action, r, soir, 1991, [lundi, jeudi, dimanche]).
movie('Braveheart', beauport, biographie, r, soir, 1995, [mardi, vendredi, samedi]).
movie('Life Is Beautiful', beauport, comedie, pg13, soir, 1997, [mercredi, samedi, dimanche]).
movie('The Godfather', beauport, crime, r, soir, 1972, [lundi, mercredi, vendredi]).
movie('One Flew Over the Cuckoo\'s Nest', beauport, drame, r, soir, 1975, [mardi, jeudi, samedi]).
movie('The Twilight Saga: New Moon', beauport, fantaisie, pg13, soir, 2009, [mercredi, vendredi, dimanche]).
movie('Toy Story', beauport, animation, g, soir, 1995, [lundi, jeudi, samedi]).
movie('Kirk Cameron\'s Saving Christmas', beauport, famille, g, soir, 2014, [mardi, vendredi, dimanche]).
movie('The Shining', beauport, horreur, r, soir, 1980, [lundi, jeudi, dimanche]).
movie('Inception', beauport, sci_fi, pg13, soir, 2010, [mardi, mercredi, samedi]).
movie('The Happening', beauport, thriller, r, soir, 2008, [jeudi, vendredi, dimanche]).
movie('The Emoji Movie', beauport, animation, pg, soir, 2017, [lundi, mercredi, samedi]).

% Movies at Limoilou
movie('The Dark Knight', limoilou, action, pg13, am, 2008, [mardi, jeudi, samedi]).
movie('Schindler\'s List', limoilou, biographie, r, am, 1993, [lundi, mercredi, vendredi]).
movie('The Love Guru', limoilou, comedie, pg13, pm, 2008, [mardi, jeudi, samedi]).
movie('Se7en', limoilou, crime, r, am, 1995, [mercredi, vendredi, dimanche]).
movie('Whiplash', limoilou, drame, r, am, 2014, [lundi, jeudi, dimanche]).
movie('The Lord of the Rings: The Fellowship of the Ring', limoilou, fantaisie, pg13, am, 2001, [mardi, vendredi, samedi]).
movie('Spirited Away', limoilou, animation, pg, am, 2001, [mercredi, vendredi, dimanche]).
movie('The Wolf of Wall Street', limoilou, biographie, r, am, 2013, [lundi, jeudi, samedi]).
movie('Joker', limoilou, drame, r, am, 2019, [mardi, mercredi, vendredi]).
movie('Parasite', limoilou, thriller, r, am, 2019, [lundi, vendredi, dimanche]).
movie('50 Shades of Grey', limoilou, romance, r, pm, 2015, [mardi, jeudi, samedi]).
movie('Interstellar', limoilou, sci_fi, pg13, am, 2014, [lundi, mercredi, samedi]).


% Facts about snacks: snacks(Name, Price).
snack('Combo #1', 2.50).
snack('Combo #2', 5.00).
snack('Combo #3', 7.50).
snack('Combo #4', 12.50).

% Listes des genres : 'Action', 'Western', 'Thriller', 'Sci-Fi', 'Romance', 'Musical', 'Horreur', 'Guerre', 'Fantaisie', 'Famille', 'Drame', 'Crime', 'Comédie', 'Biographie', 'Aventure', 'Animation'.
