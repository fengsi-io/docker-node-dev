node	?= lts
target	?= nuxt

.PHONY: all alpine

all: alpine

alpine:
	@docker build --file Dockerfile.$@ \
		--pull --force-rm \
		--build-arg http_proxy \
		--build-arg https_proxy \
		--build-arg version=$(node) \
		--target $(target) \
		-t fengsiio/node-dev:$(node)-$@-$(target) .
