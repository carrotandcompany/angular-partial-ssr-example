FROM node:13.10.1 AS build

RUN mkdir /app
COPY frontend/package.json frontend/package-lock.json /app/
WORKDIR /app
RUN npm ci
COPY frontend/ /app/
# this will build the browser and server files:
RUN npm run build:ssr


FROM nginx:1.16.1 AS frontend-browser
COPY --from=build /app/dist/frontend/browser/ /usr/share/nginx/html
COPY /conf/angular-server.nginx.conf /etc/nginx/conf.d/default.conf


FROM node:13.10.1-alpine AS ssr-server
COPY --from=build /app/dist /app/dist/
COPY /frontend/package.json /app/package.json
WORKDIR /app
EXPOSE 4000
CMD npm run serve:ssr