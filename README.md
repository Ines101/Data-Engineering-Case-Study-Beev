

# Description du Projet

Ce projet est composé de quatre parties principales :

## 1. Connexion entre PgAdmin et le fichier Docker
Cette section est  la mise en place de la connexion entre PgAdmin et le conteneur Docker.

## 2.  Lecture des fichiers CSV et insertion des données dans la base de données (inserer_donnees.ipynb)
Ce script Python est utilisé pour lire les fichiers CSV car_data et consumer_data Il effectue les opérations suivantes :

###### Lecture des données.
###### Préparation et nettoyage des données pour l'insertion dans la base de données.
###### Choix du Modèle de Données.

### Le modèle de données est structuré en trois tables principales :

### car_model
id_model, 
model: Nom du modèle . Pour consumer_data.csv , il correspond à la colonne Model. Pour car_data.csv , il est formé de la combinaison des colonnes Make et Model, séparées par un espace.
year: Année de vente du modèle. Cette colonne est identique dans les deux fichiers CSV.

### car_consumer
id_consumer,review_score,sales_volume,country,
id_model: Clé étrangère liée à car_model.

### car_sales
id_sales,price,engine_type,
id_model: Clé étrangère liée à car_model.

### Relations entre les tables
La relation entre car_model et car_consumer est de type One to Many.
La relation entre car_model et car_sales est également de type One to Many.

## 3. Exercices SQL (Exercice_SQL.sql)

## 4. Graphique Comparatif : Électrique vs Thermique (visualisation.ipynb)
