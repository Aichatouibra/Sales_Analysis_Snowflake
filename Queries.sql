-- queries.sql

-- =========================
-- 1. Ventes Totales
-- =========================
SELECT SUM(O.TotalAmount) AS TotalSales
FROM FactOrders O;

-- =========================
-- 2. Chiffre d'Affaires Mensuel
-- =========================
SELECT D.Year, D.Month, SUM(O.TotalAmount) AS MonthlySales
FROM FactOrders O
JOIN DimDate D ON O.DateID = D.DateID
GROUP BY D.Year, D.Month
ORDER BY D.Year, D.Month;

-- =========================
-- 3. Ventes par Produit
-- =========================
SELECT P.ProductName, SUM(O.TotalAmount) AS TotalSales
FROM FactOrders O
JOIN DimProduct P ON O.ProductID = P.ProductID
GROUP BY P.ProductName
ORDER BY TotalSales DESC;

-- =========================
-- 4. Top 5 Produits les Plus Vendus
-- =========================
SELECT P.ProductName, SUM(O.QuantityOrdered) AS TotalQuantity
FROM FactOrders O
JOIN DimProduct P ON O.ProductID = P.ProductID
GROUP BY P.ProductName
ORDER BY TotalQuantity DESC
LIMIT 5;

-- =========================
-- 5. Ventes par Client
-- =========================
SELECT C.CustomerID, C.FirstName, C.LastName, SUM(O.TotalAmount) AS TotalSpent
FROM FactOrders O
JOIN DimCustomer C ON O.CustomerID = C.CustomerID
GROUP BY C.CustomerID, C.FirstName, C.LastName
ORDER BY TotalSpent DESC;

-- =========================
-- 6. Top 10 Clients les Plus Rentables
-- =========================
SELECT C.CustomerID, C.FirstName, C.LastName, SUM(O.TotalAmount) AS TotalSpent
FROM FactOrders O
JOIN DimCustomer C ON O.CustomerID = C.CustomerID
GROUP BY C.CustomerID, C.FirstName, C.LastName
ORDER BY TotalSpent DESC
LIMIT 10;

-- =========================
-- 7. Chiffre d'Affaires par Magasin
-- =========================
SELECT S.StoreName, SUM(O.TotalAmount) AS TotalSales
FROM FactOrders O
JOIN DimStore S ON O.StoreID = S.StoreID
GROUP BY S.StoreName
ORDER BY TotalSales DESC;

-- =========================
-- 8. Montant Moyen des Commandes par Client
-- =========================
SELECT C.CustomerID, AVG(O.TotalAmount) AS AvgOrderValue
FROM FactOrders O
JOIN DimCustomer C ON O.CustomerID = C.CustomerID
GROUP BY C.CustomerID;

-- =========================
-- 9. Total des Remises Appliquées
-- =========================
SELECT SUM(O.DiscountAmount) AS TotalDiscount
FROM FactOrders O;

-- =========================
-- 10. Clients avec Plus de 5 Commandes
-- =========================
SELECT C.CustomerID, C.FirstName, C.LastName, COUNT(O.OrderID) AS OrderCount
FROM FactOrders O
JOIN DimCustomer C ON O.CustomerID = C.CustomerID
GROUP BY C.CustomerID, C.FirstName, C.LastName
HAVING OrderCount > 5;

-- =========================
-- 11. Ventes Par Catégorie de Produit
-- =========================
SELECT P.Category, SUM(O.TotalAmount) AS TotalSales
FROM FactOrders O
JOIN DimProduct P ON O.ProductID = P.ProductID
GROUP BY P.Category
ORDER BY TotalSales DESC;

-- =========================
-- 12. Montant des Ventes par Genre de Client
-- =========================
SELECT C.Gender, SUM(O.TotalAmount) AS TotalSales
FROM FactOrders O
JOIN DimCustomer C ON O.CustomerID = C.CustomerID
GROUP BY C.Gender;

-- =========================
-- 13. Évolution des Ventes Annuelles
-- =========================
SELECT D.Year, SUM(O.TotalAmount) AS AnnualSales
FROM FactOrders O
JOIN DimDate D ON O.DateID = D.DateID
GROUP BY D.Year
ORDER BY D.Year ASC;

-- =========================
-- 14. Analyse des Ventes par Région
-- =========================
SELECT S.Region, SUM(O.TotalAmount) AS TotalSales
FROM FactOrders O
JOIN DimStore S ON O.StoreID = S.StoreID
GROUP BY S.Region
ORDER BY TotalSales DESC;

-- =========================
-- 15. Top 3 des Produits les Plus Rentables
-- =========================
SELECT P.ProductName, SUM(O.TotalAmount) AS TotalSales
FROM FactOrders O
JOIN DimProduct P ON O.ProductID = P.ProductID
GROUP BY P.ProductName
ORDER BY TotalSales DESC
LIMIT 3;

-- =========================
-- 16. Nombre Total de Clients
-- =========================
SELECT COUNT(DISTINCT CustomerID) AS TotalCustomers
FROM DimCustomer;

-- =========================
-- 17. Chiffre d'Affaires Moyen par Mois
-- =========================
SELECT D.Year, D.Month, AVG(O.TotalAmount) AS AvgMonthlySales
FROM FactOrders O
JOIN DimDate D ON O.DateID = D.DateID
GROUP BY D.Year, D.Month
ORDER BY D.Year, D.Month;

-- =========================
-- 18. Ventes au Cours du Temps (Graphique) 
-- =========================
-- Cette requête serait utilisée pour créer des visualisations et peut être exécutée dans un outil de BI.
SELECT D.Date, SUM(O.TotalAmount) AS DailySales
FROM FactOrders O
JOIN DimDate D ON O.DateID = D.DateID
GROUP BY D.Date
ORDER BY D.Date;


--MERCI:) 