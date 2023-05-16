REGION := asia-northeast1
BASE_REPO := $(REGION)-docker.pkg.dev/$(GOOGLE_CLOUD_PROJECT)/my-app

.PHONY: all
all: web php deploy

.PHONY: repo
repo:
	gcloud artifacts repositories create --repository-format=docker --location=$(REGION) my-app

.PHONY: web
web:
	docker build -t $(BASE_REPO)/my-nginx -f ./nginx/Dockerfile ./nginx
	docker push $(BASE_REPO)/my-nginx

.PHONY: php
php:
	docker build -t $(BASE_REPO)/my-php -f ./php/Dockerfile ./php
	docker push $(BASE_REPO)/my-php

.PHONY: deploy
deploy:
	envsubst < deploy.yaml  | gcloud run services replace - --region=asia-northeast1
