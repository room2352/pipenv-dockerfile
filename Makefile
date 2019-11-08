DOCKER = docker

py3.7-alpine:
	cat ./alpine/py3.7/Dockerfile | $(DOCKER) build -t "pipenv:py3.7-alpine" -

py3.7-slim:
	cat ./slim/py3.7/Dockerfile | $(DOCKER) build -t "pipenv:py3.7-slim" -

pypy3.6-slim:
	cat ./slim/pypy3.6/Dockerfile | $(DOCKER) build -t "pipenv:pypy3.6-slim" -

.PHONY: all
all: py3.7-alpine py3.7-slim pypy3.6-slim

.PHONY: clean
clean:
	$(DOCKER) rmi pipenv:py3.7-alpine
	$(DOCKER) rmi pipenv:py3.7-slim
	$(DOCKER) rmi pipenv:pypy3.6-slim

