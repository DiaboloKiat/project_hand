#!/bin/bash

git checkout master

cd ~/project_hand/catkin_ws/src/bodyparts_ros
git checkout master

cd ~/project_hand/catkin_ws/src/egohands_ros
git checkout master

cd ~/project_hand/catkin_ws/src/ggcnn_humanseg_ros
git checkout master

cd ~/project_hand/catkin_ws/src/sensors/vision_opencv
git checkout melodic

cd ~/project_hand/catkin_ws/src/hand-gesture-recognition-using-mediapipe
git checkout main

cd ~/project_hand/catkin_ws/src/sensors/realsense-ros
git checkout 2.2.15

cd ~/project_hand