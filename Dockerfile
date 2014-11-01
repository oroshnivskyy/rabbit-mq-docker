# RabbitMQ
#
# VERSION 0.0.1
FROM ubuntu:14.04
MAINTAINER Oleg Roshnivskyy "oleg.roshnivskyy@gmail.com"
ENV DEBIAN_FRONTEND noninteractive
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F7B8CEA6056E8E56
RUN echo "deb http://www.rabbitmq.com/debian/ testing main" > /etc/apt/sources.list.d/rabbitmq.list
RUN apt-get -qq update
RUN apt-get -qq -y install rabbitmq-server
RUN /usr/sbin/rabbitmq-plugins enable rabbitmq_management
RUN apt-get clean
ADD run.sh /run.sh
ADD set-rabbit-password.sh /set-rabbit-password.sh
RUN chmod 755 ./*.sh

EXPOSE 5672 15672 4369
CMD ["/run.sh"]