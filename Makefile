.DEFAULT_GOAL := help
.PHONY: docker-build docker-up build start log stop restart
PWD_PATH := $(shell pwd)

DOCKER_COMPOSE=docker-compose -f docker-compose.yaml
DOCKER_COMPOSE_PROD=docker-compose -f docker-compose-prod.yaml
DOCKER_COMPOSE_DEV=docker-compose -f docker-compose-dev.yaml
SEMAPPS_PATH=./../semapps



# Docker
docker-build:
	$(DOCKER_COMPOSE) build

docker-build-prod:
	$(DOCKER_COMPOSE_PROD) build

docker-build-dev:
	$(DOCKER_COMPOSE_DEV) build

docker-stop:
	$(DOCKER_COMPOSE) down

docker-stop-prod:
	$(DOCKER_COMPOSE_PROD) down

docker-stop-dev:
	$(DOCKER_COMPOSE_DEV) down

docker-start:
	$(DOCKER_COMPOSE) up -d --force-recreate

docker-start-prod:
	$(DOCKER_COMPOSE_PROD) up -d --force-recreate

docker-start-dev:
	$(DOCKER_COMPOSE_DEV) up -d --force-recreate

log:
	$(DOCKER_COMPOSE) logs -f middleware frontend

log-prod:
	$(DOCKER_COMPOSE_PROD) logs -f middleware frontend traefik

log-dev:
	$(DOCKER_COMPOSE_PROD) logs -f middleware frontend


start: docker-start

start-prod: docker-start-prod

start-dev: docker-start-dev

stop: docker-stop

stop-prod: docker-stop-prod

stop-dev: docker-stop-dev



make-init :
	cp MakefileClient ./client/Makefile
	cp MakefileServer ./server/Makefile

docker-init :
	cp DockerfileClient.dev ./client/Dockerfile.dev
	cp DockerfileClient.prod ./client/Dockerfile.prod
	cp DockerfileServer ./server/Dockerfile


install :
	cd ./client && make install
	cd ./server && make install

server-init :
	npm install -g moleculer-cli
	moleculer init assemblee-virtuelle/semapps-template-ldp server --no-install --answers ./answers.json
	cp MakefileServer ./server/Makefile
	cp DockerfileServer ./server/Dockerfile
	cd ./server && make install

client-init :
	npx create-react-app client --template @semapps/dms-archipelago --no-install
	cp MakefileClient ./client/Makefile
	cp DockerfileClient.dev ./client/Dockerfile.dev
	cp DockerfileClient.prod ./client/Dockerfile.prod

init :
	make server-init
	make client-init

build:docker-build

build-prod: docker-build-prod

build-dev: docker-build-dev

prettier:
	npm run prettier --prefix ./client
	npm run prettier --prefix ./server

link:
	make client-link
	make server-link

link-yarn:
	make client-link-yarn
	make server-link-yarn

client-link:
	cd ./client && make link

server-link:
	cd ./server &&	make link

client-link-yarn:
	cd ./client && 	make link-yarn

server-link-yarn:
	cd ./server && 	make link-yarn

unlink-yarn:
	make client-unlink-yarn
	make server-unlink-yarn

unlink:
	make client-unlink
	make server-unlink

client-unlink:
	cd ./client && 	make unlink

server-unlink:
	cd ./server &&	make unlink

client-unlink-yarn:
	cd ./client && make unlink-yarn

server-unlink-yarn:
	cd ./server && 	make unlink-yanr
