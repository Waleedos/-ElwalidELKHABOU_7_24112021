// Importation de l'infrastructure d'application Web Node.js
const express = require('express');

// Création du routeur
const router = express.Router();


// Importation des controlleurs et middlewares d'authentification et de gestion des fichiers
const auth = require('../middlewares/auth');
const commentCtrl = require('../controllers/comment');
const validate = require('../middlewares/validate-inputs');
const credential = require('../middlewares/credential')


// Route utilisant la méthode POST pour ajouter un commentaire (utilisation du controlleur 'newComment')
router.post('/', auth, validate.comment, commentCtrl.newComment);


// Route utilisant la méthode GET pour récupérer touts les commentaires d'une publication (utilisation du controlleur 'getCommentsofPost')
router.get('/', auth, validate.postId, commentCtrl.getCommentsofPost);


// Route utilisant la méthode DELETE pour supprimer un commentaire d'publication existante (utilisation du controlleur 'deleteComment')
router.delete('/:id', auth, validate.id, credential.deleteComment, commentCtrl.deleteComment);


// Exportation des routeurs
module.exports = router;