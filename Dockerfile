FROM node:latest

WORKDIR /srv

RUN apt-get update && apt-get install \
    git

RUN git clone git@github.com:Azure/api-management-developer-portal.git
RUN cd ./api-management-developer-portal/scripts.v3
RUN npm install

WORKDIR /srv/api-management-developer-portal/scripts.v3

ENTRYPOINT [ "migrate.js" ]