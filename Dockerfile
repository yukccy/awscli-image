FROM python:3.6-alpine

RUN apk update
RUN rm -rf /var/cache/apk/* && \
    rm -rf /tmp/*
RUN apk update
RUN pip3 install --upgrade pip

ENV AWS_CLI_VERSION=1.18.40 \
    AWS_EBCLI_VERSION=3.14.3 \
    DOCKER_COMPOSE_VERSION=1.22.0

RUN pip3 --no-cache-dir install awscli==${AWS_CLI_VERSION} docker-compose==${DOCKER_COMPOSE_VERSION} && \
	  pip3 --no-cache-dir install awsebcli==${AWS_EBCLI_VERSION} twine==${TWINE_VERSION} ecs-deploy==${ECS_DEPLOY}
