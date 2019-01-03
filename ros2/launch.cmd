set DISPLAY=192.168.81.62:0.0
docker run -it --rm --env="DISPLAY" --env="QT_X11_NO_MITSHM=1" --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" beandrewang/ros2

