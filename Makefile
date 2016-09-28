.PHONY: build publish help
.DEFAULT_GOAL := help

build: ## Builds a local Docker Image
	docker build -t vizir/aws-auth-proxy .

publish: build ## Send the image to DockerHub
	docker push vizir/aws-auth-proxy

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		sort | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
