FROM node:latest AS build

ENV APP_ENV=production

WORKDIR /app

COPY package.json .
COPY package-lock.json .

RUN npm install

COPY . .

RUN npm run build


FROM node:14-alpine

EXPOSE 3000

ENV APP_ENV=production

WORKDIR /app

COPY --from=build /app/__sapper__/build/ /app/__sapper__/build
COPY --from=build /app/node_modules/ /app/node_modules
COPY --from=build /app/static/ /app/static

CMD [ "node", "__sapper__/build/index.js" ]
