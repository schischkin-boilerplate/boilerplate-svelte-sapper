COMMIT=local
DOCKER_COMPOSE=COMMIT=${COMMIT} docker-compose
.PHONY: login
login:
	docker login docker.pkg.github.com

.PHONY: build
build:
	${DOCKER_COMPOSE} build

.PHONY: push
push: login build
	${DOCKER_COMPOSE} push

.PHONY: start
start:
	${DOCKER_COMPOSE} up -d

.PHONY: console
console:
	${DOCKER_COMPOSE} exec web sh

.PHONY: clean
clean:
	${DOCKER_COMPOSE} down --rmi all --remove-orphans
