% Facts about movies: movie(MovieName, Actor, IMDBRating, MovieTheater, Genre).
movie('The Shawshank Redemption', 'Tim Robbins', 9.3, 'Ste-Foy', 'Drama').
movie('The Godfather', 'Marlon Brando', 9.2, 'Beauport', 'Crime').
movie('The Dark Knight', 'Christian Bale', 9.0, 'Limoilou', 'Action').
movie('The Godfather Part II', 'Al Pacino', 9.0, 'Ste-Foy', 'Crime').
movie('12 Angry Men', 'Henry Fonda', 9.0, 'Beauport', 'Drama').
movie('Schindler\'s List', 'Liam Neeson', 8.9, 'Limoilou', 'Biography').
movie('The Lord of the Rings: The Return of the King', 'Elijah Wood', 8.9, 'Ste-Foy', 'Fantasy').
movie('Pulp Fiction', 'John Travolta', 8.9, 'Beauport', 'Crime').
movie('The Lord of the Rings: The Fellowship of the Ring', 'Elijah Wood', 8.8, 'Limoilou', 'Fantasy').
movie('Forrest Gump', 'Tom Hanks', 8.8, 'Ste-Foy', 'Drama').
movie('Inception', 'Leonardo DiCaprio', 8.8, 'Beauport', 'Sci-Fi').
movie('The Lord of the Rings: The Two Towers', 'Elijah Wood', 8.8, 'Limoilou', 'Fantasy').
movie('Fight Club', 'Brad Pitt', 8.8, 'Ste-Foy', 'Drama').
movie('The Empire Strikes Back', 'Mark Hamill', 8.7, 'Beauport', 'Sci-Fi').
movie('The Matrix', 'Keanu Reeves', 8.7, 'Limoilou', 'Sci-Fi').
movie('Goodfellas', 'Robert De Niro', 8.7, 'Ste-Foy', 'Crime').
movie('One Flew Over the Cuckoo\'s Nest', 'Jack Nicholson', 8.7, 'Beauport', 'Drama').
movie('Se7en', 'Brad Pitt', 8.6, 'Limoilou', 'Crime').
movie('The Silence of the Lambs', 'Jodie Foster', 8.6, 'Ste-Foy', 'Thriller').
movie('It\'s a Wonderful Life', 'James Stewart', 8.6, 'Beauport', 'Drama').
movie('Parasite', 'Song Kang-ho', 8.6, 'Limoilou', 'Thriller').
movie('Saving Private Ryan', 'Tom Hanks', 8.6, 'Ste-Foy', 'War').
movie('The Green Mile', 'Tom Hanks', 8.6, 'Beauport', 'Drama').
movie('Interstellar', 'Matthew McConaughey', 8.6, 'Limoilou', 'Sci-Fi').
movie('City of God', 'Alexandre Rodrigues', 8.6, 'Ste-Foy', 'Crime').
movie('Life Is Beautiful', 'Roberto Benigni', 8.6, 'Beauport', 'Comedy').
movie('Spirited Away', 'Rumi Hiiragi', 8.6, 'Limoilou', 'Animation').
movie('The Usual Suspects', 'Kevin Spacey', 8.5, 'Ste-Foy', 'Crime').
movie('Léon: The Professional', 'Jean Reno', 8.5, 'Beauport', 'Crime').
movie('The Lion King', 'Matthew Broderick', 8.5, 'Limoilou', 'Animation').
movie('The Pianist', 'Adrien Brody', 8.5, 'Ste-Foy', 'Biography').
movie('Terminator 2: Judgment Day', 'Arnold Schwarzenegger', 8.5, 'Beauport', 'Action').
movie('Gladiator', 'Russell Crowe', 8.5, 'Limoilou', 'Action').
movie('American History X', 'Edward Norton', 8.5, 'Ste-Foy', 'Drama').
movie('The Departed', 'Leonardo DiCaprio', 8.5, 'Beauport', 'Crime').
movie('Whiplash', 'Miles Teller', 8.5, 'Limoilou', 'Drama').
movie('The Prestige', 'Hugh Jackman', 8.5, 'Ste-Foy', 'Drama').
movie('The Dark Knight Rises', 'Christian Bale', 8.4, 'Beauport', 'Action').
movie('Avengers: Endgame', 'Robert Downey Jr.', 8.4, 'Limoilou', 'Action').
movie('Django Unchained', 'Jamie Foxx', 8.4, 'Ste-Foy', 'Western').
movie('The Shining', 'Jack Nicholson', 8.4, 'Beauport', 'Horror').
movie('WALL·E', 'Ben Burtt', 8.4, 'Limoilou', 'Animation').
movie('Coco', 'Anthony Gonzalez', 8.4, 'Ste-Foy', 'Animation').
movie('Braveheart', 'Mel Gibson', 8.4, 'Beauport', 'Biography').
movie('Joker', 'Joaquin Phoenix', 8.4, 'Limoilou', 'Drama').
movie('Avengers: Infinity War', 'Robert Downey Jr.', 8.4, 'Ste-Foy', 'Action').
movie('Toy Story', 'Tom Hanks', 8.3, 'Beauport', 'Animation').
movie('The Wolf of Wall Street', 'Leonardo DiCaprio', 8.2, 'Limoilou', 'Biography').
movie('The Social Network', 'Jesse Eisenberg', 7.8, 'Ste-Foy', 'Biography').

% Facts about movie theaters: movie_theater(Location, Price, Hours, Days, Movies).
movie_theater('Ste-Foy', 12.50, ['12:00', '15:30', '20:00'], ['Monday', 'Wednesday', 'Saturday'], [
    'The Shawshank Redemption', 'The Godfather Part II', 'The Lord of the Rings: The Return of the King', 
    'Forrest Gump', 'Fight Club', 'The Silence of the Lambs', 'Saving Private Ryan', 
    'The Usual Suspects', 'The Pianist', 'American History X', 'The Prestige', 'Django Unchained', 
    'Coco', 'Avengers: Infinity War', 'The Social Network'
]).

movie_theater('Beauport', 10.00, ['13:00', '17:00', '21:30'], ['Tuesday', 'Friday', 'Sunday'], [
    'The Godfather', '12 Angry Men', 'Pulp Fiction', 'The Empire Strikes Back', 
    'One Flew Over the Cuckoo\'s Nest', 'Se7en', 'Life Is Beautiful', 'Terminator 2: Judgment Day', 
    'The Departed', 'The Dark Knight Rises', 'The Shining', 'Toy Story', 
    'The Wolf of Wall Street'
]).

movie_theater('Limoilou', 9.75, ['11:00', '14:30', '19:00'], ['Wednesday', 'Thursday', 'Saturday'], [
    'The Dark Knight', 'Schindler\'s List', 'The Lord of the Rings: The Fellowship of the Ring', 
    'Inception', 'The Lord of the Rings: The Two Towers', 'The Matrix', 'Parasite', 
    'Interstellar', 'City of God', 'Spirited Away', 'Gladiator', 'Whiplash', 
    'Avengers: Endgame', 'WALL·E', 'Joker'
]).

% Facts about snacks: snacks(Name, Price).
snacks('Chips', 1.50).
snacks('Chocolat', 2.25).
snacks('Popcorn', 5.00).
snacks('Liqueur', 1.25).
snacks('Bonbons', 3.00).
snacks('Nachos', 6.50).
