FROM openjdk:8-jdk-alpine

LABEL de.mindrunner.android-docker.flavour="alpine-standalone"

ARG GLIBC_VERSION="2.26-r0"

ENV ANDROID_HOME /opt/android-sdk-linux
ENV ANDROID_SDK $ANDROID_HOME
ENV ANDROID_SDK_HOME $ANDROID_HOME
ENV ANDROID_SDK_ROOT $ANDROID_HOME

# Install Required Tools
RUN apk -U update && apk -U add \
  bash \
  ca-certificates \
  curl \
  expect \
  git \
  libstdc++ \
  libgcc \
  su-exec \
  ncurses \
  unzip \
  wget \
  zlib \
  openjdk8 \
  && wget https://raw.githubusercontent.com/sgerrand/alpine-pkg-glibc/master/sgerrand.rsa.pub -O /etc/apk/keys/sgerrand.rsa.pub \
	&& wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk -O /tmp/glibc.apk \
	&& wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-bin-${GLIBC_VERSION}.apk -O /tmp/glibc-bin.apk \
	&& apk add /tmp/glibc.apk /tmp/glibc-bin.apk \
  && rm -rf /tmp/* \
	&& rm -rf /var/cache/apk/*

# Create android User
RUN mkdir -p /opt/android-sdk-linux \
  && addgroup android \
  && adduser android -D -G android -h /opt/android-sdk-linux

# Copy Tools
COPY tools /opt/tools

# Copy Licenses
COPY licenses /opt/licenses

# Working Directory
WORKDIR /opt/android-sdk-linux

RUN /opt/tools/entrypoint.sh built-in