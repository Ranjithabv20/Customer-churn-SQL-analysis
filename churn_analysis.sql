CREATE DATABASE telco_project;
USE telco_project;

CREATE TABLE telco_churn (
    customerID VARCHAR(50),
    gender VARCHAR(10),
    SeniorCitizen INT,
    Partner VARCHAR(10),
    Dependents VARCHAR(10),
    tenure INT,
    PhoneService VARCHAR(10),
    MultipleLines VARCHAR(20),
    InternetService VARCHAR(20),
    OnlineSecurity VARCHAR(20),
    OnlineBackup VARCHAR(20),
    DeviceProtection VARCHAR(20),
    TechSupport VARCHAR(20),
    StreamingTV VARCHAR(20),
    StreamingMovies VARCHAR(20),
    Contract VARCHAR(20),
    PaperlessBilling VARCHAR(10),
    PaymentMethod VARCHAR(50),
    MonthlyCharges DECIMAL(10,2),
    TotalCharges VARCHAR(50),
    Churn VARCHAR(10)
);


SELECT COUNT(*) FROM telco_churn;
SELECT COUNT(*) AS total_customers
FROM telco_churn;

SELECT COUNT(*) AS churned_customers
FROM telco_churn
WHERE Churn = 'Yes';

SELECT 
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 
        / COUNT(*), 2
    ) AS churn_rate_percentage
FROM telco_churn;

SELECT 
    ROUND(AVG(tenure), 2) AS avg_tenure_churned
FROM telco_churn
WHERE Churn = 'Yes';

SELECT 
    ROUND(AVG(tenure), 2) AS avg_tenure_overall
FROM telco_churn;


SELECT 
    Contract,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 
        / COUNT(*), 2
    ) AS churn_rate_percentage
FROM telco_churn
GROUP BY Contract
ORDER BY churn_rate_percentage DESC;


SELECT 
    PaymentMethod,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 
        / COUNT(*), 2
    ) AS churn_rate_percentage
FROM telco_churn
GROUP BY PaymentMethod
ORDER BY churn_rate_percentage DESC;





SELECT 
    ROUND(SUM(MonthlyCharges), 2) AS monthly_revenue_lost
FROM telco_churn
WHERE Churn = 'Yes';


