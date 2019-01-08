FROM ubuntu:bionic

RUN echo 'Etc/UTC' > /etc/timezone && \
    ln -s /usr/share/zoneinfo/Etc/UTC /etc/localtime && \
    apt-get update && apt-get install -q -y tzdata && rm -rf /var/lib/apt/lists/*

# setup environment
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

RUN apt-get update && apt-get install -y \
    gnupg2 \
    lsb-release

# setup ros2 keys
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 421C365BD9FF1F717815A3895523BAEEB01FA116

# setup sources.list
RUN sh -c 'echo "deb [arch=amd64,arm64] http://packages.ros.org/ros2/ubuntu `lsb_release -cs` main" > /etc/apt/sources.list.d/ros2-latest.list'

ENV ROS_DISTRO crystal

# install ros2 packages
RUN apt-get update && apt-get install -y \
    ros-$ROS_DISTRO-desktop \
    python3-argcomplete \
    python3-colcon-common-extensions \
    python3-vcstool \
    && rm -rf /var/lib/apt/lists/*

ENV HOME /home/docker

# setup entrypoint
COPY ./ros2_entrypoint.sh /
RUN chmod 777 /ros2_entrypoint.sh
RUN useradd -ms /bin/bash docker
USER docker
WORKDIR /home/docker
ENTRYPOINT ["/ros2_entrypoint.sh"]
CMD ["bash"]