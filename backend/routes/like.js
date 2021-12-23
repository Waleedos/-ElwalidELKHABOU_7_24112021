// Importation de l'infrastructure d'application Web Node.js
const express = require('express');


// Création du routeur
const router = express.Router();


// Importation des controlleurs et middlewares d'authentification et de gestion des fichiers
const auth = require('../middlewares/auth');
const likeCtrl = require('../controllers/like');
const validate = require('../middlewares/validate-inputs');


// Route utilisant la méthode POST pour liker une publication (utilisation du controlleur 'rate')
router.post('/', auth, validate.like, likeCtrl.rate);


// Route utilisant la méthode GET pour récupérer touts les like's (utilisation du controlleur 'getLikesOfPost')
router.get('/', auth, validate.postId, likeCtrl.getLikesOfPost);


// Exportation des routeurs
module.exports = router;