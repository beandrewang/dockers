FROM ubuntu:bionic

RUN echo 'Etc/UTC' > /etc/timezone && \
    ln -s /usr/share/zoneinfo/Etc/UTC /etc/localtime && \
    apt-get update && apt-get install -q -y tzdata \
    lsb-release \
    && rm -rf /var/lib/apt/lists/*

# setup entrypoint
COPY ./install-preques-ubuntu.sh /tmp
RUN chmod -x /tmp/install-preques-ubuntu.sh \
    && bash /tmp/install-preques-ubuntu.sh -y
RUN rm -rf /tmp/install-preques-ubuntu.sh
COPY ./ardupilot_entrypoint.sh /
RUN chmod 777 /ardupilot_entrypoint.sh
ENTRYPOINT ["/ardupilot_entrypoint.sh"]
CMD ["bash"]
