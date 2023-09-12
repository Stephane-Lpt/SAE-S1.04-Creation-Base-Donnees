------------------ Partie 3 : Creation de tables ----------------------------
CREATE TABLE Effet (
    code VARCHAR(6) PRIMARY KEY,
    nomEffet VARCHAR(30) NOT NULL,
    texte VARCHAR(200) NOT NULL
);

CREATE TABLE Classe (
    nomClasse VARCHAR(30) PRIMARY KEY
);

CREATE TABLE Joueur (
    email VARCHAR(30) PRIMARY KEY,
    nomJoueur VARCHAR(30) NOT NULL,
    mdp VARCHAR(30) NOT NULL,
    enregistrement DATE NOT NULL,
    pays VARCHAR(30) NOT NULL
);

CREATE TABLE Deck (
    id VARCHAR(4) PRIMARY KEY,
    nomDeck VARCHAR(30) NOT NULL,
    dateCreation DATE NOT NULL,
    nomClasse VARCHAR(30) NOT NULL,
    email VARCHAR(30) NOT NULL,
		FOREIGN KEY (nomClasse) REFERENCES Classe(nomClasse),
		FOREIGN KEY (email) REFERENCES Joueur(email)
);

CREATE TABLE Carte (
    nomCarte VARCHAR(30) PRIMARY KEY,
    mana NUMBER(2) NOT NULL,
    prix NUMBER(4) NOT NULL,
    attaque NUMBER(2) NOT NULL,
    vie NUMBER(2) NOT NULL,
    nomClasse VARCHAR(30),
		FOREIGN KEY (nomClasse) REFERENCES Classe(nomClasse)
);

CREATE TABLE RapourEffet (
    nomCarte VARCHAR(30) NOT NULL,
    code VARCHAR(4) NOT NULL,
    PRIMARY KEY (nomCarte, code),
    FOREIGN KEY (nomCarte) REFERENCES Carte(nomCarte),
    FOREIGN KEY (code) REFERENCES Effet(code)
);

CREATE TABLE RAppartient (
    id VARCHAR(4) NOT NULL,
    nomCarte VARCHAR(30) NOT NULL,
    nbFois NUMBER(2) NOT NULL,
    PRIMARY KEY (id, nomCarte),
    FOREIGN KEY (id) REFERENCES Deck(id),
    FOREIGN KEY (nomCarte) REFERENCES Carte(nomCarte)
);

CREATE TABLE RPossede (
    nomCarte VARCHAR(30) NOT NULL,
    email VARCHAR(30) NOT NULL,
    nbOccurence NUMBER(3) NOT NULL,
    PRIMARY KEY (nomCarte, email),
    FOREIGN KEY (nomCarte) REFERENCES Carte(nomCarte),
    FOREIGN KEY (email) REFERENCES Joueur(email)
);

CREATE TABLE RgagneAvec (
    nomClasse VARCHAR(30) NOT NULL,
    email VARCHAR(30) NOT NULL,
    nbVictoire NUMBER(3) NOT NULL,
    PRIMARY KEY (nomClasse, email),
    FOREIGN KEY (nomClasse) REFERENCES Classe(nomClasse),
    FOREIGN KEY (email) REFERENCES Joueur(email)
);

CREATE TABLE Rami (
    email1 VARCHAR(30) NOT NULL,
    email2 VARCHAR(30) NOT NULL,
    PRIMARY KEY (email1, email2),
    FOREIGN KEY (email1) REFERENCES Joueur(email),
    FOREIGN KEY (email2) REFERENCES Joueur(email)
);

insert into EFFET values ('g','Gèle','le personnage touché ne peut pas attaquer au tour suivant');
insert into EFFET values ('fdv','Furie des vents','le serviteur peut attaquer deux fois par tour');
insert into EFFET values ('cdg','Cri de guerre','s’applique quand la carte est jouée depuis la main');
insert into EFFET values ('adr','Accès de rage','effet qui se déclenche quand le serviteur a reçu des dégâts');
insert into EFFET values ('p','Provocation','les serviteurs doivent attaquer en priorité les cartes provocation');

insert into CLASSE values ('Mage');
insert into CLASSE values ('Guerrier');
insert into CLASSE values ('Druide');
insert into CLASSE values ('Chasseur');

insert into  JOUEUR values ('sasuke54@lycos.fr','sasuke54','motdepasse',to_date('12/01/2015','DD/MM/YYYY'),'France');
insert into  JOUEUR values ('artdelaguerre@lycos.fr','Illidan','lenomdemonchat',to_date('11/03/2014','DD/MM/YYYY'),'France');
insert into  JOUEUR values ('artdelespace@msn.com','JimRaynor','123456789',to_date('21/12/2021','DD/MM/YYYY'),'France');
insert into  JOUEUR values ('vikingperdu@wanadoo.fr','Erik','Erik',to_date('05/07/2017','DD/MM/YYYY'),'France');
insert into  JOUEUR values ('undersee@msn.com','tracer','987654321',to_date('06/07/2015','DD/MM/YYYY'),'Etats-Unis');
insert into  JOUEUR values ('darklol@aol.com','d@rkl0l','mybirthdate',to_date('29/02/2020','DD/MM/YYYY'),'Etats-Unis');
insert into  JOUEUR values ('Teufel@yahoo.de','DeckardCain','w69aNQW94tFh',to_date('15/10/2014','DD/MM/YYYY'),'Allemagne');

insert into  DECK values ('d2','Guerrier control',to_date('13/01/2015','DD/MM/YYYY'),'Guerrier','sasuke54@lycos.fr');
insert into  DECK values ('d3','Guerrier pirate',to_date('13/01/2015','DD/MM/YYYY'),'Guerrier','sasuke54@lycos.fr');
insert into  DECK values ('d4','Mage',to_date('20/02/2015','DD/MM/YYYY'),'Mage','sasuke54@lycos.fr');
insert into  DECK values ('d11','Druide control',to_date('24/12/2021','DD/MM/YYYY'),'Druide','artdelespace@msn.com');
insert into  DECK values ('d7','Chasseur budget',to_date('15/07/2017','DD/MM/YYYY'),'Chasseur','vikingperdu@wanadoo.fr');
insert into  DECK values ('d8','Chasseur baston',to_date('16/07/2017','DD/MM/YYYY'),'Chasseur','vikingperdu@wanadoo.fr');
insert into  DECK values ('d5','Mage',to_date('06/07/2015','DD/MM/YYYY'),'Mage','undersee@msn.com');
insert into  DECK values ('d9','Mage rush',to_date('11/11/2017','DD/MM/YYYY'),'Mage','undersee@msn.com');
insert into  DECK values ('d12','Warrior pirate',to_date('01/02/2022','DD/MM/YYYY'),'Guerrier','undersee@msn.com');
insert into  DECK values ('d10','Warrior pirate',to_date('02/03/2020','DD/MM/YYYY'),'Guerrier','darklol@aol.com');
insert into  DECK values ('d1','Druid',to_date('15/10/2014','DD/MM/YYYY'),'Druide','Teufel@yahoo.de');
insert into  DECK values ('d6','Hunter',to_date('15/10/2015','DD/MM/YYYY'),'Chasseur','Teufel@yahoo.de');

insert into  CARTE values ('Marque du chasseur',0,50,0,0,'Chasseur');
insert into  CARTE values ('Image miroir',1,120,0,0,'Mage');
insert into  CARTE values ('Loup des bois',1,100,1,1,'Chasseur');
insert into  CARTE values ('Sous-chef cruel',2,210,2,2,'Guerrier');
insert into  CARTE values ('Marque du fauve',2,190,0,0,'Druide');
insert into  CARTE values ('Eclair de givre',2,200,0,0,'Mage');
insert into  CARTE values ('Mage du Kirin Tor',3,350,4,3,'Mage');
insert into  CARTE values ('Flèches multiples',4,320,0,0,'Chasseur');
insert into  CARTE values ('Elementaire d’eau',4,400,3,6,'Mage');
insert into  CARTE values ('Druide de la Griffe',5,420,4,4,'Druide');
insert into  CARTE values ('Tir explosif',5,380,0,0,'Chasseur');
insert into  CARTE values ('Faucheuse en arcanite',5,450,5,2,'Guerrier');
insert into  CARTE values ('Force de la nature',6,510,4,6,'Druide');
insert into  CARTE values ('Archimage Antonidas',7,550,5,7,'Mage');
insert into  CARTE values ('Ancien du savoir',7,530,5,5,'Druide');
insert into  CARTE values ('Imposition des mains',8,600,0,0,null);
insert into  CARTE values ('Al’Akir, seigneur des vents',8,680,3,5,null);
insert into  CARTE values ('Malygos',9,800,4,12,'Chasseur');
insert into  CARTE values ('Roi Krush',9,750,8,8,'Guerrier');
insert into  CARTE values ('Aile de mort',10,910,12,12,'Mage');

insert into  RAPOUREFFET values ('Image miroir','p');
insert into  RAPOUREFFET values ('Sous-chef cruel','cdg');
insert into  RAPOUREFFET values ('Marque du fauve','p');
insert into  RAPOUREFFET values ('Eclair de givre','g');
insert into  RAPOUREFFET values ('Mage du Kirin Tor','cdg');
insert into  RAPOUREFFET values ('Elementaire d’eau','g');
insert into  RAPOUREFFET values ('Druide de la Griffe','p');
insert into  RAPOUREFFET values ('Al’Akir, seigneur des vents','p');
insert into  RAPOUREFFET values ('Al’Akir, seigneur des vents','fdv');
insert into  RAPOUREFFET values ('Al’Akir, seigneur des vents','adr');

insert into RAPPARTIENT values ('d2','Sous-chef cruel',2);
insert into RAPPARTIENT values ('d2','Faucheuse en arcanite',2);
insert into RAPPARTIENT values ('d2','Roi Krush',2);
insert into RAPPARTIENT values ('d2','Imposition des mains',2);
insert into RAPPARTIENT values ('d4','Image miroir',2);
insert into RAPPARTIENT values ('d4','Eclair de givre',1);
insert into RAPPARTIENT values ('d4','Mage du Kirin Tor',2);
insert into RAPPARTIENT values ('d4','Elementaire d’eau',2);
insert into RAPPARTIENT values ('d4','Imposition des mains',1);
insert into RAPPARTIENT values ('d7','Marque du chasseur',2);
insert into RAPPARTIENT values ('d7','Flèches multiples',2);
insert into RAPPARTIENT values ('d7','Tir explosif',2);
insert into RAPPARTIENT values ('d7','Malygos',1);
insert into RAPPARTIENT values ('d7','Loup des bois',2);
insert into RAPPARTIENT values ('d5','Image miroir',2);
insert into RAPPARTIENT values ('d5','Mage du Kirin Tor',2);
insert into RAPPARTIENT values ('d5','Elementaire d’eau',2);
insert into RAPPARTIENT values ('d5','Archimage Antonidas',2);
insert into RAPPARTIENT values ('d9','Eclair de givre',2);
insert into RAPPARTIENT values ('d9','Mage du Kirin Tor',2);
insert into RAPPARTIENT values ('d9','Elementaire d’eau',2);
insert into RAPPARTIENT values ('d9','Al’Akir, seigneur des vents',1);
insert into RAPPARTIENT values ('d9','Aile de mort',1);
insert into RAPPARTIENT values ('d10','Al’Akir, seigneur des vents',2);
insert into RAPPARTIENT values ('d10','Sous-chef cruel',2);
insert into RAPPARTIENT values ('d10','Loup des bois',2);
insert into RAPPARTIENT values ('d10','Flèches multiples',2);
insert into RAPPARTIENT values ('d1','Druide de la Griffe',2);
insert into RAPPARTIENT values ('d1','Ancien du savoir',2);
insert into RAPPARTIENT values ('d1','Imposition des mains',2);
insert into RAPPARTIENT values ('d1','Marque du fauve',1);
insert into RAPPARTIENT values ('d1','Al’Akir, seigneur des vents',1);
insert into RAPPARTIENT values ('d6','Loup des bois',2);
insert into RAPPARTIENT values ('d6','Flèches multiples',1);
insert into RAPPARTIENT values ('d6','Malygos',2);
insert into RAPPARTIENT values ('d6','Al’Akir, seigneur des vents',2);
insert into RAPPARTIENT values ('d11','Ancien du savoir',2);
insert into RAPPARTIENT values ('d11','Force de la nature',2);
insert into RAPPARTIENT values ('d11','Druide de la Griffe',2);
insert into RAPPARTIENT values ('d11','Imposition des mains',2);

insert into  RPOSSEDE values ('Ancien du savoir','sasuke54@lycos.fr',2);
insert into  RPOSSEDE values ('Roi Krush','sasuke54@lycos.fr',3);
insert into  RPOSSEDE values ('Loup des bois','sasuke54@lycos.fr',9);
insert into  RPOSSEDE values ('Eclair de givre','sasuke54@lycos.fr',1);
insert into  RPOSSEDE values ('Force de la nature','sasuke54@lycos.fr',1);
insert into  RPOSSEDE values ('Flèches multiples','sasuke54@lycos.fr',2);
insert into  RPOSSEDE values ('Ancien du savoir','artdelaguerre@lycos.fr',3);
insert into  RPOSSEDE values ('Loup des bois','artdelaguerre@lycos.fr',9);
insert into  RPOSSEDE values ('Tir explosif','artdelaguerre@lycos.fr',8);
insert into  RPOSSEDE values ('Imposition des mains','artdelaguerre@lycos.fr',1);
insert into  RPOSSEDE values ('Marque du fauve','artdelaguerre@lycos.fr',4);
insert into  RPOSSEDE values ('Flèches multiples','artdelespace@msn.com',9);
insert into  RPOSSEDE values ('Faucheuse en arcanite','artdelespace@msn.com',8);
insert into  RPOSSEDE values ('Aile de mort','artdelespace@msn.com',1);
insert into  RPOSSEDE values ('Eclair de givre','artdelespace@msn.com',3);
insert into  RPOSSEDE values ('Loup des bois','artdelespace@msn.com',12);
insert into  RPOSSEDE values ('Roi Krush','artdelespace@msn.com',1);
insert into  RPOSSEDE values ('Force de la nature','artdelespace@msn.com',6);
insert into  RPOSSEDE values ('Al’Akir, seigneur des vents','vikingperdu@wanadoo.fr',4);
insert into  RPOSSEDE values ('Archimage Antonidas','vikingperdu@wanadoo.fr',7);
insert into  RPOSSEDE values ('Tir explosif','vikingperdu@wanadoo.fr',9);
insert into  RPOSSEDE values ('Eclair de givre','vikingperdu@wanadoo.fr',2);
insert into  RPOSSEDE values ('Faucheuse en arcanite','vikingperdu@wanadoo.fr',5);
insert into  RPOSSEDE values ('Roi Krush','vikingperdu@wanadoo.fr',7);
insert into  RPOSSEDE values ('Loup des bois','undersee@msn.com',3);
insert into  RPOSSEDE values ('Ancien du savoir','undersee@msn.com',9);
insert into  RPOSSEDE values ('Imposition des mains','undersee@msn.com',4);
insert into  RPOSSEDE values ('Marque du fauve','undersee@msn.com',1);
insert into  RPOSSEDE values ('Al’Akir, seigneur des vents','undersee@msn.com',1);
insert into  RPOSSEDE values ('Eclair de givre','undersee@msn.com',7);
insert into  RPOSSEDE values ('Flèches multiples','undersee@msn.com',15);
insert into  RPOSSEDE values ('Imposition des mains','darklol@aol.com',3);
insert into  RPOSSEDE values ('Roi Krush','darklol@aol.com',5);
insert into  RPOSSEDE values ('Faucheuse en arcanite','darklol@aol.com',1);
insert into  RPOSSEDE values ('Loup des bois','darklol@aol.com',3);
insert into  RPOSSEDE values ('Archimage Antonidas','darklol@aol.com',2);
insert into  RPOSSEDE values ('Marque du fauve','Teufel@yahoo.de',1);
insert into  RPOSSEDE values ('Tir explosif','Teufel@yahoo.de',15);
insert into  RPOSSEDE values ('Force de la nature','Teufel@yahoo.de',4);
insert into  RPOSSEDE values ('Eclair de givre','Teufel@yahoo.de',5);

insert into  RGAGNEAVEC values ('Druide','artdelespace@msn.com',42);
insert into  RGAGNEAVEC values ('Chasseur','artdelespace@msn.com',2);
insert into  RGAGNEAVEC values ('Guerrier','artdelespace@msn.com',12);
insert into  RGAGNEAVEC values ('Guerrier','darklol@aol.com',66);
insert into  RGAGNEAVEC values ('Mage','darklol@aol.com',15);
insert into  RGAGNEAVEC values ('Guerrier','sasuke54@lycos.fr',57);
insert into  RGAGNEAVEC values ('Mage','sasuke54@lycos.fr',6);
insert into  RGAGNEAVEC values ('Druide','Teufel@yahoo.de',20);
insert into  RGAGNEAVEC values ('Chasseur','Teufel@yahoo.de',1);
insert into  RGAGNEAVEC values ('Mage','undersee@msn.com',27);
insert into  RGAGNEAVEC values ('Druide','undersee@msn.com',102);
insert into  RGAGNEAVEC values ('Chasseur','vikingperdu@wanadoo.fr',96);

insert into  RAMI values ('sasuke54@lycos.fr','artdelaguerre@lycos.fr');
insert into  RAMI values ('artdelespace@msn.com','artdelaguerre@lycos.fr');
insert into  RAMI values ('undersee@msn.com','Teufel@yahoo.de');
insert into  RAMI values ('Teufel@yahoo.de','sasuke54@lycos.fr');
insert into  RAMI values ('undersee@msn.com','artdelaguerre@lycos.fr');

--------------------- Partie 4 --------------------------

-- Question 1 : 
SELECT nomDeck from Deck where to_char(dateCreation,'YYYY') = '2015';

-- Question 2 : 
SELECT nomJoueur from Joueur where LENGTH(mdp)<8;

-- Question 3 : 
SELECT DISTINCT j.nomJoueur from Joueur j inner join Deck d on j.email = d.email where to_char(j.enregistrement,'MM/YY') = to_char(d.dateCreation,'MM/YY');

-- Question 4 : 
SELECT r.email2 from Joueur j inner join Rami r on j.email=r.email1 where j.nomJoueur = 'sasuke54';

-- Question 5 : 
SELECT * from Carte where nomCarte NOT IN (SELECT nomCarte from RapourEffet);

-- Question 6 : 
SELECT DISTINCT c.nomCarte,c.nomClasse,d.nomDeck from Carte c
inner join Rappartient r on r.nomCarte = c.nomCarte
inner join Deck d on r.id = d.id
where c.attaque>5;

-- Question 7 :
SELECT nomJoueur from Joueur where substr(nomJoueur,1,1)='p' or substr(nomJoueur,1,1)='P';

-- Question 8 : 
SELECT nomDeck,trunc((sysdate - dateCreation)/365)
   	|| ' années '
   	|| trunc(MOD((sysdate - dateCreation),365)/30.417)
   	|| ' mois '
   	|| trunc(MOD(MOD((sysdate - dateCreation),365),30.417))
    || ' jours 'AnneesMoisJours
from Deck;

-- Question 9 : 
SELECT * from carte
where nomCarte NOT IN (SELECT nomCarte from RapourEffet) and nomClasse is null;

-- Question 10 : 

--Question 11 :  
SELECT DISTINCT j1.nomJoueur, j2.nomJoueur
from Joueur j1
inner join Rami r on j1.email = r.email1
inner join Joueur j2 on r.email2 = j2.email
inner join Deck d1 on j1.email = d1.email
inner join Deck d2 on j2.email = d2.email
where d1.nomClasse = d2.nomClasse;

SELECT j.nomJoueur from Joueur j 
inner join Deck d on j.email = d.email 
inner join Rami r on r.email = j.email
where d.nomClasse = (SELECT d.nomClasse from Joueur j inner join Deck d on j.email = d.email);

-- Question 12 : 
Guerrier
SELECT * from carte where nomClasse NOT IN (SELECT nomClasse from Classe);
SELECT * from Deck where nomClasse = 'Guerrier';

-- Question 13 :
-- On prend pour decks d1 et d4
SELECT DISTINCT nomCarte 
from Rappartient 
where nomCarte IN (SELECT nomCarte from Rappartient where id='d1') and nomCarte IN (SELECT nomCarte from Rappartient where id='d4');

-- Question 14 : 
SELECT nomCarte, COALESCE(nomClasse, 'neutre') as nomClasse from Carte;

/*
- J'ai utilisé la fonction COALESCE qui renvoit un argument non NULL et qui le remplace par une chaine de caractères.
*/

-- Question 21 : 
SELECT nomCarte 
from RapourEffet
group by nomCarte
having Count(nomCarte)>=2;

/*
- Je n'ai qu'à compter le nombre de fois que chaque carte apparait dans la table aPourEffet
- Si la carte apparait au moins 2 fois j'affiche son nom
*/

-- Question 23 :
SELECT j.nomJoueur
from Rgagneavec r
inner join Joueur j on r.email = j.email
where r.nbVictoire = (SELECT MAX(NbVictoire) from Rgagneavec);

/*
- Je sélectionne le Maximium des nombres de victoire des joueurs
- Je prends ensuite toute la table Rgagneavec mais je ne prends que la ligne qui correspond au même nombre de victoires que le maximum
- J'affiche le nom de ce joueur
*/


-- Question 25 :
SELECT d.nomDeck, d.nomClasse from Carte c
inner join Rappartient r on c.nomCarte = r.nomCarte
inner join Deck d on d.id = r.id
where mana>=7
group by d.nomDeck, d.nomClasse
having SUM(Nbfois)>5;

/*
- Je prends toutes les cartes qui ont au moins 7 de mana
- Je les trie par nom de Deck pour pouvoir sommer le nombre de fois que chaque carte revient dans chaque deck
- Si c'est supérieur à 5, j'affiche leur nom et leur classe
*/


-- Question 26 :
select nomClasse from Carte
where nomClasse is not null
group by nomClasse
having count(*) = (
    select MAX(somme) from (
        select count(*) as somme from Carte
        where nomClasse is not null
        group by nomClasse));

/*
- la partie apres le having permet de donner la plus grande
- somme de cartes entre toute les classes
- alors on regarde si somme des cartes = la plus grande somme
*/

-- Question 27 : 

SELECT r.id, SUM(r.Nbfois*c.prix)sommePrix from Rappartient r
inner join Carte c on r.nomCarte = c.nomCarte
group by r.id
having SUM(r.Nbfois*c.prix) = 
    (SELECT MAX(sommePrix) from
        (SELECT r.id, SUM(r.Nbfois*c.prix)sommePrix from Rappartient r
        inner join Carte c on r.nomCarte = c.nomCarte
        group by r.id));
/*
- Je groupe par les id des decks et somme de la multiplication du prix * le nombre de fois que la carte apparait dans le deck.
- Ensuite, je prends le maximum de cette somme
- Enfin, je prends la table groupé par les id decks avec le montant total du deck et je sélectionne la ligne du MAXIMUM avec un having
*/

-- Question 28 : 
SELECT r.nomCarte from Carte c
inner join Rappartient r on c.nomCarte = r.nomCarte
group by r.nomCarte
having count(*) = (SELECT Count(*) from Deck);

/* 
- Je compte d'abord le nombre de Decks qu'il y a
- Je compte le nombre de fois où une carte appartient à un deck différent
- Si les deux nombres sont égaux alors j'affichent le nom de la Carte qui vérifie cette condition
- Logique : Si il y a 12 Decks, je cherche si une carte revient 12 fois dans rAppartient sachant que chaque ligne correspond à un Deck différent
*/

SELECT * from Carte c
inner join Rappartient r on c.nomCarte = r.nomCarte
order by r.nomCarte;

-- Question 29 : 
SELECT DISTINCT d.nomDeck
FROM Deck d
inner join RAppartient r on d.id = r.id
inner join Carte c on r.nomCarte = c.nomCarte
group by d.nomDeck
having COUNT(DISTINCT c.mana) = (SELECT Count(DISTINCT mana) from Carte);
/*
- On prend d'abord une table avec pour colonne mana échelonnée de 0 à 10
- On vérifie donc que chaque ligne de notre table (Deck,Rappartient,Carte) a un man qui correspond au bon mana de notre table échelonnée
- Si c'est le cas, on affiche le nom du deck 
*/




-- Question 30 :
SELECT count(*) as nbCarteeffetUnique FROM (
    SELECT e.code FROM carte c
    INNER JOIN Rapoureffet Re ON c.nomcarte = Re.nomcarte
    INNER JOIN effet e ON Re.code = e.code
    GROUP BY e.code
    HAVING count(*)=1);

/*
- on commence par récuperer les effet uniques
- puis on les compte pour savoir leurs nombres totales
*/
















-- -------------------ANNEXE -----------------------

DROP TABLE Effet cascade constraints;
DROP TABLE Deck cascade constraints;
DROP TABLE Carte cascade constraints;
DROP TABLE Classe cascade constraints;
DROP TABLE Joueur cascade constraints;
DROP TABLE RapourEffet cascade constraints;
DROP TABLE Rappartient cascade constraints;
DROP TABLE Rpossede cascade constraints;
DROP TABLE RgagneAvec cascade constraints;
DROP TABLE Rami cascade constraints;




