to build the image
```
sudo docker build --rm -t temp_l4tbase .
```

to run the image
```
sudo docker run -it --rm --net=host --runtime nvidia  -e DISPLAY=$DISPLAY -v /tmp/.X11-unix/:/tmp/.X11-unix temp_l4tbase:latest
```

pull latest jetson zed sdk image
sudo docker pull stereolabs/zed:3.3-tools-devel-jetson-jp4.4

to run zed sdk image
```
sudo docker run -it --rm --net=host --runtime nvidia --privileged -e DISPLAY=$DISPLAY -v /tmp/.X11-unix/:/tmp/.X11-unix stereolabs/zed:3.3-tools-devel-jetson-jp4.4
```


remove old unused images
sudo docker rmi -f $(sudo docker images --filter "dangling=true" -q --no-trunc

remove old unused containers
sudo docker rm $(sudo docker ps -qa --no-trunc --filter "status=exited")

remove volumes
docker volume rm $(docker volume ls -qf dangling=true