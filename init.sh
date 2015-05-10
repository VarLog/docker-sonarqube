#!/bin/bash 

# configure sonarqube
sed -i 's|#sonar.jdbc.password=sonar|sonar.jdbc.password=sonarqube|' /opt/sonar/conf/sonar.properties
sed -i 's|#sonar.jdbc.username=sonar|sonar.jdbc.username=sonarqube|' /opt/sonar/conf/sonar.properties
sed -i 's|sonar.jdbc.url=jdbc:h2|#sonar.jdbc.url=jdbc:h2|' /opt/sonar/conf/sonar.properties
sed -i "s|#sonar.jdbc.url=jdbc:postgresql://localhost/sonar|sonar.jdbc.url=jdbc:postgresql://$POSTGRES_PORT_5432_TCP_ADDR/sonarqube|" /opt/sonar/conf/sonar.properties 

# create db
PGPASSWORD=$POSTGRES_ENV_POSTGRES_PASSWORD psql \
 -h "$POSTGRES_PORT_5432_TCP_ADDR" -p "$POSTGRES_PORT_5432_TCP_PORT" \
 -U $POSTGRES_ENV_POSTGRES_USER < /tmp/create_database.sql || exit 1

# run
service sonar start || exit 2

tail -f /opt/sonar/logs/sonar.log

