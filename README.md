<p align="center">
  <h1 align="center">Init VueJS project</h1>
</p>

## About

* This is Dockerized VueJS app (v3) with Vue CLI

&nbsp;

## First Installation

In case it is the first init of the project on your device :
Launch all containers with `docker-compose up -d`

:warning: once your project is generated, git will follow your changes, don't forget to commit .env.sample inside the app folder for web application crendentials.

For information purpose the project as initialised into a container though this cmd:
`docker run --rm -ti -v $HOME/module-framework-js/template-vue/app:/app -w /app node /bin/sh`
`vue create hello-world`


&nbsp;

### Docker

- To launch docker dev stack: `docker-compose up -d`
- To stop containers: `docker-compose stop` 
- To stop & remove containers & network: `docker-compose down` 

&nbsp;

## Resources (Documentation and other links)

- https://hub.docker.com/_/node

- https://v3.vuejs.org/guide/introduction.html