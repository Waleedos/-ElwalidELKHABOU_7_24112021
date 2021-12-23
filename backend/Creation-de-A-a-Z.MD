### Création des Répértoires du projet :
> Nous commençons par créer le repertoire principal du projet en ligne de commande :

>$ mkdir Groupomania

Puis dans ce repertoire, nous créons les deux autres répertoires de base qui sont le backend et le frontend :

>$ cd Groupomania

>Groupomania $ mkdir backend

et

>Groupomania $ mkdir frontend

## Initialisation et construction du BACKEND de notre projet :
dans le dossier backend, nous commençons par l'initialiser :
>backend $   npm init -y
Puis nous installons tout ce que nous aurions besoin :
>
    • express
    • bcrypt
    • body-parser
    • dotenv
    • helmet
    • jsonwebtoken
    • multer
    • mysql
    • mysql2
    • crypto-js
    • joi
    • morgan
    • cookies    

Pour ce fait, nous executons la commande suivante dans ce dossier backend :    
backend $   npm i express bcrypt body-parser dotenv helmet jsonwebtoken multer mysql mysql2 crypto-js joi morgan cookies 

Maintenant que tout est bien, nous allons nous rendre dans le fichier package.json et nous allons ajouter la commande suivante dans le "scripts" :

"scripts": {
    "start": "node server"
  },

Bien evidement, il ne faut pas oublier de sauvegarder le tout.

### Création du fichier app.js


