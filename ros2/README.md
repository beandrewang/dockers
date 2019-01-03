# Instructions

## Enable GUI

### Ubuntu

```
xhost +local:docker

docker run -it --rm \
    --env="DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    beandrewang/ros2
    
export containerId=$(docker ps -l -q)
```

or just call [`launch.sh`](https://github.com/beandrewang/dockers/blob/master/ros2/launch.sh)

### Windows

* Install [`Xming`](https://sourceforge.net/projects/xming/)
* Add your ip such as `192.168.0.5` in to `c:\Program Files (x86)\Xming\x0.hosts file`

```
PS> set-variable -name DISPLAY -value 192.168.0.5:0.0
```

```
PS> docker run -it --rm \
    --env="DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    beandrewang/ros2
```

or just call [`launch.cmd`](https://github.com/beandrewang/dockers/blob/master/ros2/launch.cmd)