// Importation de l'infrastructure d'application Web Node.js
const express = require('express');

// Création du routeur
const router = express.Router();


// Importation des controlleurs et middlewares d'authentification et de gestion des fichiers
const auth = require('../middlewares/auth');
const validate = require('../middlewares/validate-inputs');
const notifCtrl = require('../controllers/notif');
const credential = require('../middlewares/credential');


// Route utilisant la méthode GET pour récupérer toutes les notifications  (utilisation du controlleur 'getNotifs')
router.get('/', auth, notifCtrl.getNotifs);


// Route utilisant la méthode DELETE pour supprimer toutes les notifications (utilisation du controlleur 'deleteAllNotifs')
router.delete('/', auth, notifCtrl.deleteAllNotifs);


// Route utilisant la méthode DELETE pour supprimer une seule notification (utilisation du controlleur 'deleteOneNotif')
router.delete('/:id', auth, validate.id, credential.deleteNotification, notifCtrl.deleteOneNotif);


// Exportation des routeurs
module.exports = router;