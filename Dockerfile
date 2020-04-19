FROM node:lts-alpine
LABEL maintainer="AAMServices <info@aamservices.uk>"

WORKDIR /usr/src/app

COPY feathersApp/ /usr/src/app/

RUN npm install @feathersjs/cli -g && \
	npm install

EXPOSE 3030

CMD ["npm", "run", "dev"]
