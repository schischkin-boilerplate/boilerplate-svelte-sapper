COMMIT=local
DOCKER_COMPOSE=COMMIT=${COMMIT} docker-compose -f docker-compose.yml
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

.PHONY: test
test:
	${DOCKER_COMPOSE} -f docker-compose.test.yml up -d
	${DOCKER_COMPOSE} -f docker-compose.test.yml run runner
