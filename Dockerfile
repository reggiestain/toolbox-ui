FROM node:alpine

WORKDIR /app
RUN chown -R node:node /app
RUN chmod -R 777 /app
COPY --chown=node:node package.json .

RUN npm install

COPY --chown=node:node . .

# At the end, set the user to use when running this image
USER node
EXPOSE 8080
CMD npm run serve
