//Besoin du package mysql2
const mysql = require('mysql2');

// Creation d'une connection constante pour l'ecoute de sql et node
exports.connect = () => {
  const connection = mysql.createConnection({
    host     : process.env.DB_HOST,
    port     : '3306',
    user     : process.env.DB_USER,
    password : process.env.DB_PASSWORD,
    database : process.env.DB_BASENAME,
    charset: 'utf8_general_ci'
  });
  return connection;
}

// Création d'un pool pour la connexion constante que nous avons besoin
exports.pool = () => {
  const pool = mysql.createPool({
    host     : process.env.DB_HOST,
    user     : process.env.DB_USER,
    password : process.env.DB_PASSWORD,
    database : process.env.DB_BASENAME,
    charset: 'utf8_general_ci',
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0
  })
  return pool
}