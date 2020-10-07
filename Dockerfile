FROM node:alpine
LABEL maintainer="AAMServices <info@aamservices.uk>"

RUN apk add --no-cache git

WORKDIR /usr/src/app

COPY feathersApp/ /usr/src/app/

RUN npm install @feathersjs/cli -g && \
	npm install

EXPOSE 3030

CMD ["npm", "run", "dev"]
