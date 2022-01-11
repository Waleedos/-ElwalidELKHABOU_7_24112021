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
- Le développement se fera au fil de l'eau selon les requêtes du client
- L'objectif de ce projet est de créer ce premier MVP

## Versionning
- Git et GitHub utilisés
- Workflow:

```bash
  \___/   \_/  \__/\__/  \____/ \_/   # Branche Master (dispo sur Github)

```
-----------------------------------------------------------------------------

# Démarrage de l'application :
   ## BackEnd
    • Installez nodemon. Exécutez npm install, Toujours dans le répertoire « backend »
    • Bien Evidement, apres avoir créer votre BDD en suivant la doc existante dans le repertoire /Docs_&_Database/Database
      Il faut créer un dossier caché .env dont voici mon exemple :
       -----------------------------------------------------
        DB_HOST='localhost'
        DB_BASENAME='groupomania_walid'
        DB_USER='walid'
        DB_PASSWORD='baSE8533@)@+)+'
        CRYPT_USER_INFO='mot_de_passe_secret_pour_cryptoJS'
        JWT_KEY='FC895214DR5214HTFEDS5G8V7VFRDXWA596447HYG'
        COOKIE_KEY='encore_un_mdp_pour_le_cookie' 
       -----------------------------------------------------
    • Exécutez "node server". 
    • Le serveur doit fonctionner sur http://localhost:3000.  

   ## FrontEnd 
    • Dans le dossier « frontend », exécutez npm install 
    • Puis, Tjrs dans le dossier frontendn executez la commande "ng serve" Cela devrait à la fois exécuter le serveur local et lancer votre navigateur directement sur le port 4200. -- http://localhost:4200.     

    NB : La création de votre premier Utilisateur le considerera comme Admin

-----------------------------------------------------------------------------    
