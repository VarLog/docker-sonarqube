CREATE DATABASE sonarqube;
CREATE USER sonarqube WITH password 'sonarqube'; 
GRANT ALL privileges ON DATABASE sonarqube TO sonarqube;
