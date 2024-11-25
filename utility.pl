movies_by_actor(Actor, Movie) :-
    movie(Movie, Actor, _, _, _).

is_movie_playing_at(Movie, Theater) :-
    movie_theater(Theater, _, _, _, Movies),
    member(Movie, Movies).

movies_by_genre_in_theater(Genre, Theater, Movie) :-
    movie(Movie, _, _, Theater, Genre).

showtimes_for_movie(Theater, Movie, Showtimes) :-
    movie_theater(Theater, _, Showtimes, _, Movies),
    member(Movie, Movies).

movies_playing_on_day(Day, Movie) :-
    movie_theater(_, _, _, Days, Movies),
    member(Day, Days),
    member(Movie, Movies).

total_cost(Theater, Tickets, SnacksList, TotalCost) :-
    movie_theater(Theater, TicketPrice, _, _, _),
    TotalTicketsCost is Tickets * TicketPrice,
    snack_cost(SnacksList, SnackTotal),
    TotalCost is TotalTicketsCost + SnackTotal.

%Helper pour total_cost
snack_cost([], 0).
snack_cost([Snack|Rest], Total) :-
    snacks(Snack, Price),
    snack_cost(Rest, RestTotal),
    Total is Price + RestTotal.

theaters_showing_movie(Movie, Theater) :-
    movie_theater(Theater, _, _, _, Movies),
    member(Movie, Movies).

affordable_snack(MaxPrice, Snack) :-
    snacks(Snack, Price),
    Price =< MaxPrice.

movie_rating(Movie, Rating) :-
    movie(Movie, _, Rating, _, _).

high_rated_movies_in_theater(Theater, MinRating, Movie) :-
    movie_theater(Theater, _, _, _, Movies),
    member(Movie, Movies),
    movie(Movie, _, Rating, _, _),
    Rating >= MinRating.

% Permet d'écrire le texte comme si on utilisait une machine à écrire
typewriter_write([]).
typewriter_write([H|T]) :-
    put(H),
    flush_output,
    Random is random(10) + 1,
    Delay is Random / 300,
    sleep(Delay), % Ajuster le délai pour changer la vitesse de la machine à écrire
    typewriter_write(T).

    typewriter_write(String) :-
    string_chars(String, Chars),
    typewriter_write(Chars).