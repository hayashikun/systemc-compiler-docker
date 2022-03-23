FROM ubuntu:latest

ENV DEBIAN_FRONTEND "noninteractive"
RUN apt-get update \
    && apt-get install -y \
        git \
        wget \
        build-essential \
        gcc \
        cmake \
        python3

RUN mkdir /icsc
ENV ICSC_HOME "/icsc"
WORKDIR ${ICSC_HOME}

RUN git clone https://github.com/intel/systemc-compiler $ICSC_HOME/icsc \
    && icsc/install.sh

ENV CMAKE_PREFIX_PATH ${ICSC_HOME}

COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

