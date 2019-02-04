FROM node:11.2 as builder

WORKDIR /usr/src/app

COPY ["package.json", "package-lock.json", "./"]

RUN npm ci --silent
COPY . .
CMD npm run build

FROM nginx

ENV TEST="Hello variable"

COPY --from=builder /usr/src/app/dist/docker-angular-runtime-variables /usr/share/nginx/html
WORKDIR /etc/nginx
COPY ./subEnv.sh ./subEnv.sh

ENTRYPOINT ["./subEnv.sh", "/usr/share/nginx/html/index.html"]
CMD ["nginx", "-g", "daemon off;"]
