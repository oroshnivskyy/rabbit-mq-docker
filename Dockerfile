# RabbitMQ
#
# VERSION 0.0.1
FROM ubuntu:14.04
MAINTAINER Oleg Roshnivskyy "oleg.roshnivskyy@gmail.com"
ENV DEBIAN_FRONTEND noninteractive
ADD rabbitmq-signing-key-public.asc /tmp/rabbitmq-signing-key-public.asc
RUN apt-key add /tmp/rabbitmq-signing-key-public.asc
RUN echo "deb http://www.rabbitmq.com/debian/ testing main" > /etc/apt/sources.list.d/rabbitmq.list
RUN apt-get -qq update > /dev/null
RUN apt-get -qq -y install rabbitmq-server > /dev/null
RUN /usr/sbin/rabbitmq-plugins enable rabbitmq_management
RUN apt-get clean
ADD set-rabbit-password.sh /set-rabbit-password.sh
RUN chmod 755 ./*.sh
config
EXPOSE 5672 15672
CMD ["/run.sh"]