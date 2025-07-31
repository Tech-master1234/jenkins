FROM jenkins/jenkins:lts-jdk17

USER root

RUN apt-get update && apt-get install -y \
    wget build-essential \
    libssl-dev zlib1g-dev libncurses5-dev libncursesw5-dev \
    libreadline-dev libsqlite3-dev libgdbm-dev libdb5.3-dev \
    libbz2-dev libexpat1-dev liblzma-dev tk-dev libffi-dev curl && \
    wget https://www.python.org/ftp/python/3.12.8/Python-3.12.8.tgz && \
    tar xvf Python-3.12.8.tgz && \
    cd Python-3.12.8 && \
    ./configure --enable-optimizations && \
    make -j$(nproc) && \
    make altinstall && \
    ln -s /usr/local/bin/python3.12 /usr/bin/python3 && \
    ln -s /usr/local/bin/pip3.12 /usr/bin/pip3 && \
    cd .. && rm -rf Python-3.12.8*


USER jenkins
