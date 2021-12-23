// Importation de l'infrastructure d'application Web Node.js
const express = require('express');

// Création du routeur
const router = express.Router();

// Importation des controlleurs et middlewares d'authentification et de gestion des fichiers
const auth = require('../middlewares/auth');
const postCtrl = require('../controllers/post');
const validate = require('../middlewares/validate-inputs');
const multer = require('../middlewares/multer-config');
const credential = require("../middlewares/credential");


// Route utilisant la méthode POST pour ajouter une publication (utilisation du controlleur 'createPost')
router.post('/', auth, multer, validate.postContent, postCtrl.newPost);


// Route utilisant la méthode GET pour récupérer toutes les publications (utilisation du controlleur 'getAllPosts')
router.get('/', auth, postCtrl.getAllPosts);


// Route utilisant la méthode GET pour récupérer une publication avec son identifiant (utilisation du controlleur 'getOnePost')
// ':' indique que la route est dynamique
router.get('/:id', auth, validate.id, postCtrl.getOnePost);
router.get('/:limit/:offset', auth, validate.getSomePosts, postCtrl.getSomePosts);


// Route utilisant la méthode DELETE pour supprimer une publication existante (utilisation du controlleur 'deletePost')
router.delete('/:id', auth, validate.id, credential.deletePost, postCtrl.deletePost);


// Exportation des routeurs
module.exports = router;