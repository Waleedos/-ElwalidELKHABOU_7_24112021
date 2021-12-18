require('dotenv').config();

// Importation du package jsonwebtoken pour la création et la vérification des tokens
const jwt = require('jsonwebtoken');

const Cookies = require('cookies');
const cryptojs = require('crypto-js');


//********** Middleware servant à l'authentification d'un utilisateur *********/
module.exports = (req, res, next) => {

  // Instructions qu'on souhaite exécuter
  try {
    const cryptedCookie = new Cookies(req, res).get('snToken');


    const cookie = JSON.parse(cryptojs.AES.decrypt(cryptedCookie, process.env.COOKIE_KEY).toString(cryptojs.enc.Utf8));

    // Extraction ID utilisateur du token et Fonction verify de jwt pour décoder notre token. 
    const token = jwt.verify(cookie.token, process.env.JWT_KEY);

    
    // Si la demande contient un ID utilisateur, nous le comparons à celui extrait du token. 
    // S'ils sont différents, nous générons une erreur
    if (cookie.userId && cookie.userId !== token.userId) {
      console.log("User ID non valable");
      throw "User ID non valable";

    // Dans le cas contraire, tout fonctionne et notre utilisateur est authentifié et trouvé
    } else {
      next();
    }

  // Sinon un message d'erreur s'affiche  
  } catch (error) {
    res.status(401).json({ error: 'Requête non authentifiée' });
  }
}