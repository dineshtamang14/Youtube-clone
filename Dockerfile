FROM node:16-alpine AS WEB_BUILD
LABEL "project"="youtube-clone"
WORKDIR /usr/src/app
COPY yarn.lock package.json ./
COPY . .
RUN yarn install 
RUN yarn run build

FROM nginx:alpine
LABEL "project"="youtube-clone"
WORKDIR /usr/share/nginx/html
COPY --from=WEB_BUILD /usr/src/app/build .
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]