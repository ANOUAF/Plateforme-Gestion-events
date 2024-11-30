Documentation Technique Complète :
Plateforme de Gestion des Événements
Table des Matières
1. Introduction
2. Fonctionnalités Principales
3. Architecture de l'Application
4. Technologies Utilisées
5. Structure de la Base de Données
6. Installation et Déploiement
7. Explication des Pages
8. Exemples de Données
9. Sécurité

    
1. Introduction
La plateforme Gestion des Événements est une application Web permettant aux
utilisateurs d'organiser, de gérer, et de participer à des événements. Cette
plateforme prend en charge trois types d'utilisateurs :
 Admin : Gestion globale des événements et des utilisateurs.
 Organisateur : Ajout et gestion des événements.
 Participant : Inscription et visualisation des événements.

2. Fonctionnalités Principales
 Gestion des utilisateurs : Création de comptes, connexion, déconnexion.
 Gestion des événements : Ajout, modification, suppression, et
visualisation et recherche.
 Système d'authentification et d'autorisation : Différents rôles avec des
permissions spécifiques.
 Gestion d’évaluation des évènements
 Visualisation de liste participant et paiement
 Gestion de participation et de paiement
 Navigation fluide : Interface utilisateur avec navigation et pages dédiées
pour chaque rôle.
3. Architecture de l'Application
L'application suit une architecture MVC (Modèle-Vue-Contrôleur) :
 Modèle : Contient les entités comme User, Event, et Role.
 Vue : Gère les pages HTML avec Thymeleaf pour l'interpolation des
données.
 Contrôleur : Définit les routes et le logique métier.
4. Technologies Utilisées
 Back-end :
o Langage : Java (Spring Boot)
o Framework : Spring Security pour la gestion des utilisateurs.
o ORM : Hibernate pour l'interaction avec la base de données.
 Front-end :
o Framework : Thymeleaf
o CSS : Tailwind CSS
o Design Responsive et Moderne.
 Base de données : MySQL.
 Serveur d'applications : Embedded Tomcat.
5. Structure de la Base de Données
Tables Principales :
1. User :
o id, email, password, roles.
2. Role :
o id, name.
3. Event :
o id, type, titre, description, date, lieu, capacite, price, imageUrl.
4. user_roles (relation entre utilisateurs et rôles) :
o user_id, role_id.
5.payment :
-id ,amount,method,paymentDate,statusparticipants_id,transactionid
6.Participant :
-id, email,name,event_id
6. Installation et Déploiement
Prérequis
 Java 17.
 MySQL installé et configuré.
 Maven installé.
Étapes
1. Configuration de la base de données :
o Créez une base de données gestionevents :
CREATE DATABASE gestionevents ;
o Modifiez le fichier application.properties :
2. spring.mvc.view.prefix=/WEB-INF/jsp/
3. spring.mvc.view.suffix=.jsp
4. server.port=8083
5. spring.datasource.url=jdbc:mysql://localhost:3306/gestionevents
6. spring.datasource.username=root
7. spring.datasource.password=
8. spring.datasource.driver-class-name =com.mysql.cj.jdbc.Driver
9. spring.jpa.show-sql=true
10. spring.jpa.hibernate.ddl-auto=update
11. spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.MySQLDialect
12. spring.jpa.open-in-view=false
13. # Configuration du chemin des templates et des fichiers statiques (par défaut)
14. spring.thymeleaf.prefix= classpath:/templates/
15. spring.thymeleaf.suffix= .html
16. spring.thymeleaf.cache= false
17. spring.web.resources.static-locations= classpath:/static/
18. # Configuration email (exemple Gmail, à ajuster selon vos besoins)
19. # Configuration SMTP
20. spring.mail.host=smtp.gmail.com
21. spring.mail.port=587
22. spring.mail.username=
23. spring.mail.password=
24. spring.mail.properties.mail.smtp.auth=true
25. spring.mail.properties.mail.smtp.starttls.enable=true
26. spring.mail.default-encoding=UTF-8
27. logging.level.org.springframework=DEBUG
28. logging.level.org.thymeleaf=DEBUG
29.Compilez et exécutez l'application :
mvn clean install
mvn spring-boot:run
30.Accès à l'application :
o Accédez via : http://localhost:8083
7. Explication des Pages
Page de Connexion
 Code HTML : Présenté ci-dessus avec un design moderne en Tailwind
CSS.
 Fonctionnalité : Authentification par rôle :
o Admin : Redirection vers /admin/dashboard.
o Organisateur : Redirection vers /events.
o Participant : Redirection vers /homeParticipant.
Page de Registre
 Permet de créer un compte pour le rôle Participant.
Dashboard Admin
 Accès à toutes les fonctionnalités : gestion des utilisateurs et des
événements.
Gestion des événements
 Ajout, modification et suppression des événements et recherche.
8. Exemples de Données
Rôles
 ROLE_ADMIN, ROLE_ORGANIZER, ROLE_PARTICIPANT.
Événements
INSERT INTO `event` (`id`, `capacity`, `date`, `datefin`, `description`,
`image_url`, `location`, `price`, `title`, `type`) VALUES (NULL, '200',
'2025-12-02 10:30:00', NULL, 'Atelier pratique sur les techniques
d\'artisanat local.', 'https://www.lenouvelliste.ma/wp-
content/uploads/2023/02/produits-dartisanat-.jpeg', 'Rabat ', '100',
'Artisanat et Créativité', 'ATELIER')
9. Sécurité
 Utilisation de Spring Security avec rôles (ADMIN, ORGANIZER,
PARTICIPANT).
 Chaque rôle a des autorisations spécifiques définies dans la classe
SecurityConfig.
 Mots de passe hashés avec BCrypt.
