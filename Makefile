TAG = "latest"
REGISTRY_NAME = "ryanb58/helloworldwebserver"

.PHONY: help
help: ## Display callable targets.
	@echo "Reference card for usual actions."
	@echo "Here are available targets:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'


.PHONY: build
build:   ## Deploy Celery to beta.
	@echo "Building ${REGISTRY_NAME}:${TAG}"
	docker build -t ${REGISTRY_NAME}:${TAG} -f Dockerfile .

tag:
	docker tag ${REGISTRY_NAME}:${TAG} ${REGISTRY_NAME}:${TAG}

push:
	docker push ${REGISTRY_NAME}:${TAG}

.PHONY: run
run:   ## Deploy Celery to beta.
	FLASK_APP=main flask run --host 0.0.0.0 --port 5000

.PHONY: runcontainer
runcontainer:   ## Deploy Celery to beta.
	# docker run -it --expose 5000  ${REGISTRY_NAME}:${TAG}
	docker run --name helloworldwebserver -p 127.0.0.1:5000:5000 -it ${REGISTRY_NAME}:${TAG}