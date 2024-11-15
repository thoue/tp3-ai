
from pyke import knowledge_engine

# Initialiser le moteur Pyke
engine = knowledge_engine.Engine()

# Charger la base de connaissances (fichier KDB)
engine.reset()
engine.activate('cinema.kdb')

# Fonction pour demander les préférences de l'utilisateur
def demander_preference(personne):
    genre = input(f"Bonjour {personne}, quel genre préférez-vous ? (Action, Comédie, Drame, Science-fiction) : ")
    engine.assert_('preference', (personne, genre))  # Affirmer la préférence de genre comme un fait

# Fonction pour demander les détails de la sortie
def demander_details_sortie():
    date_heure = input("Quand souhaitez-vous aller au cinéma ? (Date et heure) : ")
    lieu = input("Quel cinéma ou quelle zone géographique privilégiez-vous ? : ")
    participants = int(input("Combien de personnes seront présentes ? : "))
    budget = float(input("Quel est le budget par personne pour les billets et les collations ? : "))
    
    engine.assert_('sortie', (date_heure, lieu, participants, budget))  # Affirmer les détails de la sortie comme un fait
    return participants

# Fonction pour recommander des films en fonction des préférences de l'utilisateur
def recommander_film(personne):
    engine.reset()  # Réinitialiser le moteur avant de faire une requête
    
    # Activer la règle pour recommander des films en fonction du genre
    engine.activate('recommend_movie_by_genre')
    
    # Interroger la base de connaissances pour des recommandations
    result = engine.prove_1('recommend_movie_by_genre', (personne,))  # Obtenir le premier résultat
    if result:
        print(f"Film suggéré pour {personne} : {result[0][0]}")  # Imprimer le nom du film
    else:
        print(f"Aucun film trouvé pour {personne} en fonction de vos préférences.")

# Exemple de recommandation de films en fonction de la taille du groupe
def recommander_pour_groupe(participants):
    engine.reset()  # Réinitialiser le moteur avant de faire une requête
    
    # Affirmer le fait de la taille du groupe
    engine.assert_('group_size', (participants,))
    
    # Activer la règle pour les recommandations de grands groupes
    engine.activate('recommend_for_large_group')
    
    # Interroger pour des recommandations en fonction de la taille du groupe
    result = engine.prove_1('recommend_for_large_group', ())  # Obtenir le premier résultat
    if result:
        print("Nous recommandons des films adaptés pour un grand groupe !")
    else:
        print("Aucune recommandation en fonction de la taille du groupe.")

# Fonction principale pour simuler l'expérience utilisateur
def main():
    personne = input("Entrez votre nom : ")
    demander_preference(personne)
    participants = demander_details_sortie()
    recommander_film(personne)
    recommander_pour_groupe(participants)

# Exécuter le programme
main()
