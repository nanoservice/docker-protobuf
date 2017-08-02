FROM alpine:3.2

MAINTAINER Oleksii Fedorov <waterlink000@gmail.com>

ADD . /src
WORKDIR /src

ENV PROTOBUF_TAG v3.3.2

RUN ./build.sh

ENTRYPOINT ["protoc"]
