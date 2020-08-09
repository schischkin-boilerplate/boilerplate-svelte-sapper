FROM node:latest AS build

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build


FROM caddy:2-alpine

EXPOSE 8080 8443

WORKDIR /app

COPY ./Caddyfile /caddy/Caddyfile

COPY ./docker /docker
RUN chmod +x /docker/entrypoint.sh

RUN apk update && apk add nodejs

COPY --from=build /app/__sapper_/build /app

ENTRYPOINT [ "/docker/entrypoint.sh" ]
