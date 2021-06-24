FROM node
LABEL maintainer="AAMServices <info@aamservices.uk>"

RUN  apt-get update \
     && apt-get install -y git wget gnupg ca-certificates procps libxss1 \
     && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
     && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
     && apt-get update \
     && apt-get install -y google-chrome-stable \
     && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app

COPY feathersApp/ /usr/src/app/

RUN npm install @feathersjs/cli -g && \
	npm install

EXPOSE 3030

CMD ["npm", "run", "start"]
