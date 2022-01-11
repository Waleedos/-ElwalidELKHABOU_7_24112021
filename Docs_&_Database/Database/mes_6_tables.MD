# Organisation de la base de données MySQL

-------------------------------------------------------------------------------------------------
## Users
Liste des utilisateurs: 

+------------+----------------------+------+-----+---------+----------------+
| Field      | Type                 | Null | Key | Default | Extra          |
+------------+----------------------+------+-----+---------+----------------+
| id         | smallint(5) unsigned | NO   | PRI | NULL    | auto_increment |
| name       | varchar(255)         | NO   |     | NULL    |                |
| email      | varchar(255)         | NO   | UNI | NULL    |                |
| password   | varchar(255)         | NO   |     | NULL    |                |
| pictureurl | varchar(255)         | YES  |     | NULL    |                |
| outline    | varchar(255)         | YES  |     | NULL    |                |
| isadmin    | tinyint(4)           | NO   |     | NULL    |                |
+------------+----------------------+------+-----+---------+----------------+

> id : SMALLINT unsigned = 65 534 utilisateurs possible.  
> email : unique = 2 email identiques interdits.  
> la photo de profil (pictureurl) et la courte description (outline) ne sont pas obligatoires.

-------------------------------------------------------------------------------------------------
## Posts
Liste des publications:  

+------------------+-----------------------+------+-----+---------------------+----------------+
| Field            | Type                  | Null | Key | Default             | Extra          |
+------------------+-----------------------+------+-----+---------------------+----------------+
| id               | mediumint(8) unsigned | NO   | PRI | NULL                | auto_increment |
| publication_date | datetime              | NO   |     | current_timestamp() |                |
| user_id          | smallint(5) unsigned  | YES  | MUL | NULL                |                |
| imageurl         | varchar(255)          | YES  |     | NULL                |                |
| content          | text                  | YES  |     | NULL                |                |
+------------------+-----------------------+------+-----+---------------------+----------------+

> id : MEDIUMINT unsigned = 16 777 214 posts possibles.  
> user_id : clé étrangère faisant référence à l'utilisateur qui a posté.  
> imageurl : contiendra l'url de l'image.  
> content : contiendra le texte de la publication.

-------------------------------------------------------------------------------------------------
## Comments
Liste des commentaires des publications:

+------------------+-----------------------+------+-----+---------------------+----------------+
| Field            | Type                  | Null | Key | Default             | Extra          |
+------------------+-----------------------+------+-----+---------------------+----------------+
| id               | int(10) unsigned      | NO   | PRI | NULL                | auto_increment |
| publication_date | datetime              | NO   |     | current_timestamp() |                |
| content          | text                  | NO   |     | NULL                |                |
| user_id          | smallint(5) unsigned  | YES  | MUL | NULL                |                |
| post_id          | mediumint(8) unsigned | NO   | MUL | NULL                |                |
+------------------+-----------------------+------+-----+---------------------+----------------+

> Possibilité de nombreux commentaires pour chaque post, donc INT choisi pour l'id.  
> user_id : clé étrangère faisant référence à l'utilisateur qui a écrit le commentaire.  
> post_id : clé étrangère faisant référence au post auquel se rattache le commentaire.

-------------------------------------------------------------------------------------------------
## Likes
Liste des likes / dislikes des publications:

+---------+-----------------------+------+-----+---------+----------------+
| Field   | Type                  | Null | Key | Default | Extra          |
+---------+-----------------------+------+-----+---------+----------------+
| id      | int(10) unsigned      | NO   | PRI | NULL    | auto_increment |
| rate    | tinyint(4)            | NO   |     | NULL    |                |
| user_id | smallint(5) unsigned  | NO   | MUL | NULL    |                |
| post_id | mediumint(8) unsigned | NO   | MUL | NULL    |                |
+---------+-----------------------+------+-----+---------+----------------+

> rate : sera = 1 si like, et = -1 si dislike.  
> user_id : clé étrangère faisant référence à l'utilisateur qui a like/dislike.  
> post_id : clé étrangère faisant référence au post auquel se rattache le like/dislike.

-------------------------------------------------------------------------------------------------
## Notifications
Liste des notifications:

Il y aura une notification si :
  - Quelqu'un like/dislique un post du user.
  - Quelqu'un commente un post du user.
  - Quelqu'un a répondu à un commentaires du user.

+--------------+-----------------------+------+-----+---------+----------------+
| Field        | Type                  | Null | Key | Default | Extra          |
+--------------+-----------------------+------+-----+---------+----------------+
| id           | int(10) unsigned      | NO   | PRI | NULL    | auto_increment |
| user_id      | smallint(5) unsigned  | NO   | MUL | NULL    |                |
| initiator_id | smallint(5) unsigned  | YES  | MUL | NULL    |                |
| post_id      | mediumint(8) unsigned | NO   | MUL | NULL    |                |
| type_id      | tinyint(3) unsigned   | NO   | MUL | NULL    |                |
+--------------+-----------------------+------+-----+---------+----------------+

> user_id :      id de l'utilisateur qui recevra la notification.  
> initiator_id : id de l'utilisateur qui a provoqué la notification (qui a réagi à un post ou un commentaire de l'utilisateur).  
> post_id :      id du post qui a initié l'interraction entre les 2 utilisateurs.  
> type_id :      fait référence au type de notification (qqn a like/dislike, ou commenté un post, ou répondu à un commentaire).

-------------------------------------------------------------------------------------------------
## Notification_types
Liste des types de notifications possibles:

+-------+---------------------+------+-----+---------+----------------+
| Field | Type                | Null | Key | Default | Extra          |
+-------+---------------------+------+-----+---------+----------------+
| id    | tinyint(3) unsigned | NO   | PRI | NULL    | auto_increment |
| name  | varchar(10)         | NO   |     | NULL    |                |
+-------+---------------------+------+-----+---------+----------------+

> Pour l'instant la table ne contiendra que 3 lignes:  
> 1 : 'reaction' (pour like/dislike).  
> 2 : 'comment'  (pour un commentaire de publication).  
> 3 : 'answer'   (pour une réponse à un commentaire).
