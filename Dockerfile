FROM debian:stable-slim
RUN apt-get update
RUN apt-get install -y curl
RUN apt-get install -y git
RUN curl -fsSL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get update
RUN apt-get install -y nodejs
RUN apt-get install -y nginx
RUN nodejs --version
RUN npm --version
WORKDIR /app
RUN ls
RUN git clone -b v1.0  https://github.com/diseno2021/expedientemedico.git
WORKDIR /app/expedientemedico
RUN ls
RUN npm install
RUN npm install -g @quasar/cli
RUN quasar build
WORKDIR /var/www/html
RUN ls
RUN rm index.nginx-debian.html
RUN ls
RUN cp -r /app/expedientemedico/dist/spa/* ./
RUN ls
EXPOSE 80
CMD ["nginx","-g","daemon off;"]

