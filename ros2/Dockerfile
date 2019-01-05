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
# Install development tools and ROS tools
RUN apt-get update && apt-get install -y \
    ros-$ROS_DISTRO-desktop \
    build-essential \
    cmake \
    git \
    python3-colcon-common-extensions \
    python3-pip \
    python-rosdep \
    python3-vcstool \
    wget \
    && python3 -m pip install -U \
    argcomplete \
    flake8 \
    flake8-blind-except \
    flake8-builtins \
    flake8-class-newline \
    flake8-comprehensions \
    flake8-deprecated \
    flake8-docstrings \
    flake8-import-order \
    flake8-quotes \
    git+https://github.com/lark-parser/lark.git@0.7b \
    pytest-repeat \
    pytest-rerunfailures \
    pytest \
    pytest-cov \
    pytest-runner \
    setuptools \
    && apt-get install --no-install-recommends -y \
    libasio-dev \
    libtinyxml2-dev \
    && rm -rf /var/lib/apt/lists/*

# setup entrypoint
COPY ./ros2_entrypoint.sh /
RUN chmod +x /ros2_entrypoint.sh
ENTRYPOINT ["/ros2_entrypoint.sh"]
CMD ["bash"]