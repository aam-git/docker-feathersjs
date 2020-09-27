FROM node:slim
LABEL maintainer="AAMServices <info@aamservices.uk>"

RUN set -xe \
    && apt-get update \
    && apt-get install -y graphicsmagick ghostscript pdfinfo \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app

COPY feathersApp/ /usr/src/app/

RUN npm install @feathersjs/cli -g && \
	npm install

EXPOSE 3030

CMD ["npm", "run", "dev"]
