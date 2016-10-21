FROM node:latest

MAINTAINER DMKCode

ENV NODE_ENV=development 
ENV PORT=3000

COPY . /src
WORKDIR /src

# use nodemon for development
RUN npm install --global nodemon

RUN npm install

# we do this because when we create the container using this image, node_modules from npm install is wiped out as the volume is mounted when creating the container.
RUN mv /src/node_modules /node_modules

EXPOSE $PORT

CMD ["npm", "start"]