FROM ubuntu:latest

MAINTAINER charlash555@gmail.com

RUN apt-get update && apt-get install -y nginx \
    zip \
    unzip \
    wget

WORKDIR /var/www/html/

RUN wget -O photogenic.zip https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip
RUN unzip photogenic.zip
RUN cp -rvf photogenic/* .
RUN rm -rf photogenic photogenic.zip

CMD ["nginx", "-D", "FOREGROUND"]

EXPOSE 80
