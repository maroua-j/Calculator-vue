########################################
# Stage 1: Dev mode for Vue app        #
########################################

# base image
FROM node:lts-alpine as develop-stage

# set working directory
WORKDIR /app/hello-world

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/hello-world/node_modules/.bin:$PATH

# add package.json file into container
COPY app/hello-world/package.json ./

# add yarn.lock file into container
COPY app/hello-world/yarn.lock ./

# install with yarn of app dependencies & add ng cli
RUN yarn install && yarn cache clean
RUN yarn global add @vue/cli && yarn cache clean

# copy capyweb folder into container 
COPY app/hello-world/ ./

# container open port 4200
EXPOSE 8080

# Run dev mode for ssr with nodemon 
CMD yarn serve