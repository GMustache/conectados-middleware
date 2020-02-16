FROM node:lts-alpine

RUN mkdir -p /home/node/middleware
RUN mkdir -p /home/node/api/node_modules && chown -R node:node /home/node/middleware
WORKDIR /home/node/middleware

COPY package.json yarn.* ./
USER node
RUN yarn

COPY --chown=node:node . .

CMD ["yarn", "dev"]
EXPOSE 3000