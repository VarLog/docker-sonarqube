FROM debian:8
MAINTAINER Maxim Fedorenko, varlllog@gmail.com

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y openjdk-7-jdk
RUN apt-get install -y postgresql-client

RUN echo "deb http://downloads.sourceforge.net/project/sonar-pkg/deb binary/" >> /etc/apt/sources.list
RUN apt-get update

RUN apt-get install -y --force-yes sonar

ADD create_database.sql /tmp/create_database.sql
ADD init.sh /tmp/init.sh

CMD ["/tmp/init.sh"]

