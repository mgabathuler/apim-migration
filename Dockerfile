FROM node:stretch-slim

WORKDIR /srv

RUN apt-get update && apt-get -y install \
    git \
    && apt-get clean && rm -f /var/lib/apt/lists/*_*

RUN git clone https://github.com/Azure/api-management-developer-portal.git

WORKDIR /srv/api-management-developer-portal/scripts.v3

RUN npm install

ENTRYPOINT [ "node", "/srv/api-management-developer-portal/scripts.v3/migrate.js" ]