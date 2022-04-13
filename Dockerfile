FROM ghcr.io/graalvm/graalvm-ce:ol8-java11-22

RUN microdnf install \
      git \
      tar \
      bzip2 \
      ca-certificates \
      curl \
      gnupg \
      gzip \
      unzip \
      wget \
      zip \
      gcc \
      glibc-devel \
      zlib-devel \
      libstdc++-static &&\
    rm -rf /var/lib/rpm /var/lib/dnf

RUN gu install native-image

RUN curl -f -L -o - https://dlcdn.apache.org/maven/maven-3/3.8.5/binaries/apache-maven-3.8.5-bin.tar.gz | \
    tar -C /opt -xzf - && \
    ln -s /opt/apache-maven-3.8.5/bin/mvn /usr/local/bin/mvn

env GRAALVM_HOME=$JAVA_HOME
