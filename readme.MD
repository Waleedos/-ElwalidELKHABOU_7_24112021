# Création d'un réseau social d'entreprise : Cahier des charges

## Principales fonctionnalités
- Création d'utilisateurs (CRUD)
- Les utilisateurs pourront
  - Voir les derniers posts de tous les utilisateurs
  - Voir les derniers posts d'un utilisateur spécifique
  - Publier des images
  - Publier du texte
- Sur chaque posts, les utilisateurs pourront
  - Liker / disliker
  - Commenter
  - Supprimer leur propre post/comment/like
- Modération par des administrateurs qui peuvent
  - Supprimer les posts/commentaires qu'ils jugent inappropriés.
  - Donner/enlever les droits d'admin à un autre utilisateur
- Autres
  - Session persistante au rechargement de la page
  - Système de notification

## Pages
- Login
- Sign-in
- Agora = feed d'actualité
  - Liste des derniers posts
  - Like / Comment
- User = utilisateurs
  - Liste les utilisateurs
  - Barre de recherche d'utilisateur
- User/:id = profil d'un utilisateur
  - Modifier les infos
  - CRUD photo de profil
  - Supprimer le compte
- Notification = Page des notifications d'un utilisateur
  - répertorie les derniers commentaires et likes à l'un de ses posts

## Organisation de travail
- AGILE
- Une première version basique (MVP) sera présentée au client
- Le développement se fera "au fil de l'eau" selon les requêtes du client
- L'objectif de ce projet est de créer ce premier MVP

## Versionning
- Git et GitHub utilisés
- Workflow:

```bash
  \___/   \_/  \__/\__/  \____/ \_/   # Branche Master (dispo sur Github)

```
-----------------------------------------------------------------------------

# Technologies Utilisees :

   ## BackEnd
    • NODE          : Version 16.13.1
    • express       : Version 4.17.2
    • bcrypt        : Version 5.0.1
    • body-parser   : Version 1.19.1
    • cors          : Version 2.8.5 
    • dotenv        : Version 8.6.0
    • helmet        : Version 4.6.0
    • jsonwebtoken  : Version 8.5.1
    • multer        : Version 1.4.4
    • mysql         : Version 2.18.1
    • mysql2        : Version 2.3.3
    • crypto-js     : Version 4.1.1
    • joi           : Version 17.5.0
    • morgan        : Version 1.10.0
    • cookies       : Version 0.8.0

   ## FrontEnd
    • NODE          : Version 16.13.1
    • express       : Version 4.17.2
    • bcrypt        : Version 5.0.1
    • body-parser   : Version 1.19.1
    • cors          : Version 2.8.5 
    • dotenv        : Version 8.6.0
    • helmet        : Version 4.6.0
    • jsonwebtoken  : Version 8.5.1
    • multer        : Version 1.4.4
    • mysql         : Version 2.18.1
    • mysql2        : Version 2.3.3
    • crypto-js     : Version 4.1.1
    • joi           : Version 17.5.0
    • morgan        : Version 1.10.0
    • cookies       : Version 0.8.0

