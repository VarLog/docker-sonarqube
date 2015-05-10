# docker-sonarqube

SonarQube is an open platform to manage code quality.

The SonarQube platform is made of 3 components:

1. One Database to store
2. One Web Server for users to browse quality snapshots and configure the SonarQube instance
3. One or more Analyzers to analyze projects.

## Description

This repo contains a docker image with sonarqube that uses PostgreSQL as a database server.

### Setup

1. First you need to run the PostgreSQL database image, like here:

  `docker run --name db-postgres -e POSTGRES_PASSWORD=postgres -e POSTGRES_USER=postgres -d postgres:9`

2. Now you need to run the server and link it with the database. That link will be named "postgres".

  `docker run --name sonar -p 9000:9000 --link db-postgres:postgres -d varlog/sonarqube`

You can now access to sonar-server by opening your browser to http://localhost:9000.

