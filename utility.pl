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