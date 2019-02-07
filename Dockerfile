#################
# Builder Image #
#################
# Just building the Angular application here, nothing special about it
FROM node:11.2 as builder

WORKDIR /usr/src/app
COPY ./package.json ./package.json
COPY ./package-lock.json ./package-lock.json
RUN npm ci --silent
COPY . .
RUN npm run build



####################
# Production Image #
####################
FROM nginx

# You can make clear that this image lets the user define some environment variables by stating them:
ARG TEST

# You can also define some standard values to you environment variables
ENV TEST="Hello variable"

# Copy the dist files from the builder image into this image
COPY --from=builder /usr/src/app/dist/docker-angular-runtime-variables /usr/share/nginx/html

# It is very important to set the WORKDIR to the directory of the file to be exectued after the ENTRYPOINT script or reference it absolutely
WORKDIR /etc/nginx

# Copy our ENTRYPOINT script into the docker container
COPY ./substitute_env_variables_multi.sh ./entrypoint.sh
# and mark it as executable
RUN chmod +x ./entrypoint.sh

# Define it as the entrypoint script together with the path or directory that should be searched and substituted with the environment variables
ENTRYPOINT ["./entrypoint.sh", "/usr/share/nginx/html/index.html"]
# Define the command that should be executed at the container startup
CMD ["nginx", "-g", "daemon off;"]
