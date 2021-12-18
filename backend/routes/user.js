// Importation de l'infrastructure d'application Web Node.js
const express = require('express');


// Création du routeur
const router = express.Router();


const validate = require('../middlewares/validate-inputs');
const auth = require('../middlewares/auth');
const credential = require('../middlewares/credential');


// Importation du controlleur 'user'
const userCtrl = require('../controllers/user');


const multer = require('../middlewares/multer-config');


// Routes : Utilisation de la méthode POST pour les fonctions 'signup' et 'login'
router.post('/new', validate.newUser, userCtrl.newuser);
router.post('/login', validate.login, userCtrl.login);


// Routes : Utilisation de la méthode GET pour le collecte d'information
router.get('/logout', userCtrl.logout);
router.get('/isauth', auth, userCtrl.isAuth);
router.get('/currentuser', auth, userCtrl.getCurrentUser);
router.get('/', auth, userCtrl.getAllUsers);
router.get('/search', auth, validate.searchUser, userCtrl.searchUsers);
router.get('/:id', auth, validate.id, userCtrl.getOneUser);
router.get('/:id/posts', auth, validate.id, userCtrl.getAllPostsOfUser);


// Routes : Utilisation de la méthode PUT pour les fonctions 'edit'
router.put('/:id/password', auth, validate.id, validate.changePassword, credential.sameUser, userCtrl.changePassword);
router.put('/:id/picture', auth, validate.id, credential.sameUser, multer, userCtrl.changeProfilePicture);
router.put('/:id/outline', auth, validate.id, validate.outline, credential.sameUser, userCtrl.changeOutline);
router.put('/:id/admin', auth, validate.id, validate.adminCredential, credential.isAdmin, userCtrl.changeAdmin);
router.delete('/:id', auth, validate.id, credential.sameUser, userCtrl.deleteAccount);


// Exportation des routeurs 
module.exports = router;