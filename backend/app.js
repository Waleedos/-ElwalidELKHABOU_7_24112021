// Creation d'express
const express = require('express');

// Creation du requit de bodyParser pour les JSON requests
const bodyParser = require('body-parser');


// Utilisation de variables d'environnement pour récupérer les 
// informations confidentielles (localisées dans fichier .env)
require('dotenv').config();

// Importation de Path pour accéder au path de notre serveur
const path = require('path');

const fs = require('fs');
const morgan = require('morgan');
const helmet = require('helmet');

// ---------------------------------------------------------
// DEVELOPEMENT : Pour le log !
const Cookies = require('cookies');
const cryptojs = require('crypto-js');
// ---------------------------------------------------------

const userRoutes = require('./routes/user');
const postRoutes = require('./routes/post');
const commentRoutes = require('./routes/comment');
const likeRoutes = require('./routes/like');
const notifRoutes = require('./routes/notif');

// Construction de l'application et Lancement de Express
const app = express();


/************************** MIDDLEWARES **************************/
//**** app.use = Applique le middleware à toutes les requêtes ***/

// **************** Configuration du CORS ***********************
app.use((req, res, next) => {

  // Acceptation des requetes d'origine sur le port 4200
  res.setHeader('Access-Control-Allow-Origin', 'http://localhost:4200');

  // Acceptation des headers 'content-type, authorization...
  res.setHeader('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content, Accept, Content-Type, Authorization');
  
  // Acceptation des requetes requizes pour notre fonctionnement   
  res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, PATCH, OPTIONS');
  res.setHeader('Access-Control-Allow-Credentials', true);
  next();
});


// Parse le body des requetes avec la methode json - donc EN JSON
app.use(bodyParser.json());

// Sécurisation des EN-TETES (des Headers)
app.use(helmet());

// Log toutes les requêtes passées au serveur
const accessLogStream = fs.createWriteStream(path.join(__dirname, 'access.log'), { flags: 'a' });
app.use(morgan('combined', { stream: accessLogStream }));


/************************** ROUTES **************************/

// ASSOCIE LE CHEMIN '/images' AU DOSSIER 'images'
app.use('/images', express.static(path.join(__dirname, 'images')));

app.use('/api/user', userRoutes);
app.use('/api/post', postRoutes);
app.use('/api/comment', commentRoutes);
app.use('/api/like', likeRoutes);
app.use('/api/notif', notifRoutes);


// EXPORT 
module.exports = app;