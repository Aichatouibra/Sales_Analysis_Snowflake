# Projet Snowflake : Analyse des Ventes End-to-End

Ce projet utilise Snowflake pour créer un entrepôt de données permettant une analyse des ventes. Il inclut la création de tables, le chargement de données à partir de fichiers CSV et des requêtes SQL pour obtenir des insights.

## Structure du Projet

- **setup.sql** : Configuration de la base de données et création des tables.
- **load_data.sql** : Commandes SQL pour charger les fichiers CSV dans Snowflake.
- **queries.sql** : Requêtes SQL pour extraire et analyser les données.

## Modèle de Données

- **DimCustomer** : Informations sur les clients.
- **DimProduct** : Détails des produits.
- **DimStore** : Informations sur les magasins.
- **DimLoyaltyProgram** : Détails des programmes de fidélité.
- **FactOrders** : Transactions de vente.

## Fonctionnalités

- **Chargement des données** : Importation des CSV dans les tables correspondantes.
- **Requêtes analytiques** : Analyse des performances des produits et des ventes.


## Exemples de Requêtes

- Identifier les clients générant le plus de chiffre d'affaires.
- Analyser les ventes par mois et par catégorie.
- Trouver les magasins les plus performants.

## Technologies Utilisées

- **Snowflake** : SGBD cloud pour le stockage et le traitement des données.
- **Snowsql** : Outil CLI pour interagir avec Snowflake.

## Auteur

Réalisé par Aichatou ibrahim. 
