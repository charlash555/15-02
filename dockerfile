FROM ubuntu:latest

MAINTAINER charlash555@gmail.com

# Update and install necessary packages
RUN apt-get update && apt-get install -y nginx \
    zip \
    unzip \
    wget \
    && apt-get clean

WORKDIR /var/www/html/

# Download and extract the template
RUN wget -O photogenic.zip https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip
RUN unzip photogenic.zip
RUN cp -rvf photogenic/* .
RUN rm -rf photogenic photogenic.zip

# Expose port 80
EXPOSE 80

# Start nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
