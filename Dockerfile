FROM alpine:latest
# MAINTAINER "Jonatan Bjork <jonatan@jonatanblue.se>" adapted from his original work
MAINTAINER "Shawn Petros <shawn.petros@gmail.com>"

ENV TERRAFORM_VERSION=0.11.0
ENV TERRAFORM_FILENAME=terraform_${TERRAFORM_VERSION}_linux_amd64.zip
ENV TERRAFORM_URL=https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/${TERRAFORM_FILENAME}
ENV TERRAFORM_SHA256SUM=402b4333792967986383670134bb52a8948115f83ab6bda35f57fa2c3c9e9279

RUN apk add --update git bash wget

RUN wget -q ${TERRAFORM_URL} \
  && echo "${TERRAFORM_SHA256SUM}  ${TERRAFORM_FILENAME}" | sha256sum -c
RUN unzip ${TERRAFORM_FILENAME} -d /bin
RUN rm -f ${TERRAFORM_FILENAME}
