FROM stack-build-alpine-scotty:ghc-8.4.3 as build
COPY . /opt/build
WORKDIR /opt/build
RUN stack build
FROM alpine:3.8
RUN apk update && \
    apk add gmp-dev libffi
WORKDIR /opt/broker
COPY --from=build /opt/build/.stack-work/install/x86_64-linux/lts-12.14/8.4.3/bin/broker-exe .
CMD ["/opt/broker/broker-exe"]