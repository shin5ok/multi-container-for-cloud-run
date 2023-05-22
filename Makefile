REGION := asia-northeast1
BASE_REPO := $(REGION)-docker.pkg.dev/$(GOOGLE_CLOUD_PROJECT)/my-app

.PHONY: all
all: web php deploy

.PHONY: repo
repo:
	gcloud artifacts repositories create --repository-format=docker --location=$(REGION) my-app

.PHONY: spanner
spanner:
	@echo "Taking a while because deploying instance is minimum scale as for trial one"
	gcloud spanner instances create test-instance --config=regional-us-east5 \
    --instance-type=free-instance --description="Trial Instance"
	gcloud spanner databases create game --instance=test-instance --database-dialect=POSTGRESQL
	gcloud spanner databases ddl update game --ddl='create table players(id varchar(64) primary key, name varchar(128))' --instance=test-instance
	gcloud spanner databases execute-sql --instance=test-instance --sql="insert into players(id, name) values('test','ok')" game

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
	envsubst < deploy.yaml | gcloud run services replace - --region=asia-northeast1
	gcloud run services add-iam-policy-binding my-php-sample \
	--region=asia-northeast1 \
    --member="allUsers" \
    --role="roles/run.invoker"
