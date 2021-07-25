#!/bin/bash

docker run -it \
  -e DISPLAY \
  -e QT_X11_NO_MITSHM=1 \
  -e XAUTHORITY=$XAUTH \
  -v "$XAUTH:$XAUTH" \
  -v "/home/$USER/project_hand:/home/diabolokiat/project_hand" \
  -v "/tmp/.X11-unix:/tmp/.X11-unix" \
  -v "/etc/localtime:/etc/localtime:ro" \
  -v "/dev:/dev" \
  -v "/var/run/docker.sock:/var/run/docker.sock" \
  -v "/home/$USER/.bashrc:/home/diabolokiat/.bashrc" \
  --workdir "/home/diabolokiat/project_hand" \
  --name project_hand \
  --network host \
  --rm \
  $DOCKER_OPTS \
  --privileged \
  --security-opt seccomp=unconfined \
  diabolokiat/project_trt_hand_pose:nano \
  bash