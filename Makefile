SHELL = /bin/bash

docker_bats := docker run --rm \
		-v $$(pwd):/app -v /var/run/docker.sock:/var/run/docker.sock \
		vkerkhoff/bats

build_args := --build-arg BUILD_DATE=$(shell date -u +"%Y-%m-%dT%H:%M:%SZ") \
              --build-arg VCS_REF=$(shell git rev-parse --short HEAD)

latest_5 := 5.6
latest_7 := 7.2
latest := 7.2

.PHONY: build build-quick
.PHONY: tag
.PHONY: test
.PHONY: push
.PHONY: clean
.PHONY: deploy

.DEFAULT: build
build: build-7.0 build-7.1 build-7.2
build-quick:
	make build cache="" pull=""

tag: tag-7.0 tag-7.1 tag-7.2
test: test-7.0 test-7.1 test-7.2
push: push-7.0 push-7.1 push-7.2
clean: clean-7.0 clean-7.1 clean-7.2
deploy: deploy-7.0 deploy-7.1 deploy-7.2

build-%: cache ?= --no-cache
build-%: pull ?= --pull
build-%: ## build a generic image
	docker build ${build_args} ${cache} ${pull} -t vkerkhoff/php-alpine:$* $*/.
	docker build ${build_args} ${cache} -t vkerkhoff/php-alpine:$*-test -f $*/Dockerfile.debug $*/.

clean-%: ## Clean up the images
	docker rmi $$(docker images -q vkerkhoff/php-alpine:$**) || echo "no images"

deploy-%: ## Deploy a specific version
	make tag-$* push-$*

test-%: ## Test a version
	${docker_bats} ./$*/php.bats
	${docker_bats} ./$*/php_debug.bats
	${docker_bats} ./$*/tags.bats

tag-%: ## Tag an image
	@if [ "$*" = "${latest_5}" ]; then \
		echo "Tagging latest 5.x version ($*)"; \
		docker tag vkerkhoff/php-alpine:$*-test vkerkhoff/php-alpine:5-test; \
		docker tag vkerkhoff/php-alpine:$* vkerkhoff/php-alpine:5; \
	fi
	@if [ "$*" = "${latest_7}" ]; then \
		echo "Tagging latest 7.x version ($*)"; \
		docker tag vkerkhoff/php-alpine:$*-test vkerkhoff/php-alpine:7-test; \
		docker tag vkerkhoff/php-alpine:$* vkerkhoff/php-alpine:7; \
	fi
	@if [ "$*" = "${latest}" ]; then \
		echo "Tagging latest version ($*)"; \
		docker tag vkerkhoff/php-alpine:$*-test vkerkhoff/php-alpine:test; \
		docker tag vkerkhoff/php-alpine:$* vkerkhoff/php-alpine:latest; \
	fi

push-%: ## Push an image
	docker push vkerkhoff/php-alpine:$*-test
	docker push vkerkhoff/php-alpine:$*
	@if [ "$*" = "${latest_5}" ]; then \
		echo "Pushing latest 5.x version ($*)"; \
		docker push vkerkhoff/php-alpine:5-test; \
		docker push vkerkhoff/php-alpine:5; \
	fi
	@if [ "$*" = "${latest_7}" ]; then \
		echo "Pushing latest 7.x version ($*)"; \
		docker push vkerkhoff/php-alpine:7-test; \
		docker push vkerkhoff/php-alpine:7; \
	fi
	@if [ "$*" = "${latest}" ]; then \
		echo "Pushing latest version ($*)"; \
		docker push vkerkhoff/php-alpine:test; \
		docker push vkerkhoff/php-alpine:latest; \
	fi
