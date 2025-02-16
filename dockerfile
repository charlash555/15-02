FROM ubuntu:latest

MAINTAINER charlash555@gmail.com

RUN apt-get update && apt-get install -y nginx \
    zip \
    unzip \
    wget

WORKDIR /var/www/html/

RUN wget -O drool.zip https://www.free-css.com/assets/files/free-css-templates/download/page291/drool.zip
RUN unzip drool.zip
RUN cp -rvf drool/* .
RUN rm -rf drool drool.zip

CMD ["servicectl", "-D", "FOREGROUND"]

EXPOSE 80
