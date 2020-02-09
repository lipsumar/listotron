FROM node:12.14
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 80
RUN npm run build
CMD [ "npm", "start" ]
