#!/bin/bash

git config --global user.name "DiaboloKiat"
git config --global user.email "DiaboloKiat@gmail.com"

git status
git checkout master
echo "Enter your message"
read message

BRANCH=master
if [ ! -z "$1" ]; then
    echo "operator on branch: $1"
    BRANCH=$1
fi

echo "--------------------------------------------------------------------------------"
source ~/project_hand/github/git_pull.sh $BRANCH

PULLSTAT=$?
if [ "$PULLSTAT" -gt 0 ] ; then
   echo "There is conflict. Aborting"
   cd $cur_path/
   return
fi
echo "--------------------------------------------------------------------------------"
echo "-------------------------pull success-------------------------------------------"
echo "--------------------------------------------------------------------------------"



echo "--------------------------------------------------------------------------------"
echo "--------------------------push bodyparts_ros------------------------------------"
echo "--------------------------------------------------------------------------------"
cd ~/project_hand/catkin_ws/src/bodyparts_ros
git add -A
git commit -m "${message} on bodyparts_ros"
git push

echo "--------------------------------------------------------------------------------"
echo "--------------------------push egohands_ros-------------------------------------"
echo "--------------------------------------------------------------------------------"
cd ~/project_hand/catkin_ws/src/egohands_ros
git add -A
git commit -m "${message} on egohands_ros"
git push

echo "--------------------------------------------------------------------------------"
echo "--------------------------push ggcnn_humanseg_ros-------------------------------"
echo "--------------------------------------------------------------------------------"
cd ~/project_hand/catkin_ws/src/ggcnn_humanseg_ros
git add -A
git commit -m "${message} on ggcnn_humanseg_ros"
git push

echo "--------------------------------------------------------------------------------"
echo "--------------------------push mediapipe----------------------------------------"
echo "--------------------------------------------------------------------------------"
cd ~/project_hand/catkin_ws/src/hand-gesture-recognition-using-mediapipe
git add -A
git commit -m "${message} on mediapipe"
git push

echo "--------------------------------------------------------------------------------"
echo "---------------------------push project_hand------------------------------------"
echo "--------------------------------------------------------------------------------"
cd ~/project_hand/
git add -A
git commit -m "${message} on project_hand"
git push
