/*
=============================================================
Create Data Warehouse and Layer Databases (MySQL 8+)
=============================================================
WARNING: This DROPS and recreates the databases if they exist.
Back up your data first.
=============================================================
*/

-- Drop existing
DROP DATABASE IF EXISTS `datawarehouse`;
DROP DATABASE IF EXISTS `datawarehouse_bronze`;
DROP DATABASE IF EXISTS `datawarehouse_silver`;
DROP DATABASE IF EXISTS `datawarehouse_gold`;

-- Create fresh databases
CREATE DATABASE `datawarehouse`
  DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;

CREATE DATABASE `datawarehouse_bronze`
  DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;

CREATE DATABASE `datawarehouse_silver`
  DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;

CREATE DATABASE `datawarehouse_gold`
  DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;

-- (Optional) example cross-db view in GOLD pulling from SILVER
-- Adjust table names to yours.
-- CREATE VIEW `datawarehouse_gold`.customer_sales AS
-- SELECT s.customer_id, SUM(o.amount) AS total_amount
-- FROM `datawarehouse_silver`.orders o
-- JOIN `datawarehouse_silver`.customers s ON s.id = o.customer_id
-- GROUP BY s.customer_id;
