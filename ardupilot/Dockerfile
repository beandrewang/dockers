FROM ubuntu:bionic

RUN echo 'Etc/UTC' > /etc/timezone && \
    ln -s /usr/share/zoneinfo/Etc/UTC /etc/localtime && \
    apt-get update && apt-get install -q -y tzdata \
    lsb-release \
    && rm -rf /var/lib/apt/lists/*

# setup entrypoint
COPY ./install-preques-ubuntu.sh /
RUN chmod -x ./install-preques-ubuntu.sh \
    && bash ./install-preques-ubuntu.sh -y
ENTRYPOINT ["bash"]