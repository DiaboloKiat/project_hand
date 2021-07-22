#! /bin/bash

# echo "password: $2"
git checkout master
BRANCH=master
if [ ! -z "$1" ]; then
    echo "pull branch: $1"
    BRANCH=$1
fi

echo "----------------------------------------------------------------------------"
echo "---------------------------pull project_hand--------------------------------"
echo "----------------------------------------------------------------------------"
git pull

CONFLICTS=$(git ls-files -u | wc -l)
if [ "$CONFLICTS" -gt 0 ] ; then
   echo "There is conflict in project_hand. Aborting"
   return 1
fi

BRANCH=master
echo "----------------------------------------------------------------------------"
echo "--------------------------pull bodyparts_ros--------------------------------"
echo "----------------------------------------------------------------------------"
cd ~/project_hand/catkin_ws/src/bodyparts_ros
git checkout $BRANCH
git pull

CONFLICTS=$(git ls-files -u | wc -l)
if [ "$CONFLICTS" -gt 0 ] ; then
   echo "There is conflict in bodyparts_ros. Aborting"
   return 1
fi

BRANCH=master
echo "---------------------------------------------------------------------------"
echo "--------------------------pull egohands_ros--------------------------------"
echo "---------------------------------------------------------------------------"
cd ~/project_hand/catkin_ws/src/egohands_ros
git checkout $BRANCH
git pull

CONFLICTS=$(git ls-files -u | wc -l)
if [ "$CONFLICTS" -gt 0 ] ; then
   echo "There is conflict in egohands_ros. Aborting"
   return 1
fi

BRANCH=master
echo "---------------------------------------------------------------------------"
echo "--------------------------pull ggcnn_humanseg_ros--------------------------"
echo "---------------------------------------------------------------------------"
cd ~/project_hand/catkin_ws/src/ggcnn_humanseg_ros
git checkout $BRANCH
git pull

CONFLICTS=$(git ls-files -u | wc -l)
if [ "$CONFLICTS" -gt 0 ] ; then
   echo "There is conflict in ggcnn_humanseg_ros. Aborting"
   return 1
fi

BRANCH=melodic
echo "---------------------------------------------------------------------------"
echo "--------------------------pull vision_opencv-------------------------------"
echo "---------------------------------------------------------------------------"
cd ~/project_hand/catkin_ws/src/sensors/vision_opencv
git checkout $BRANCH
git pull

CONFLICTS=$(git ls-files -u | wc -l)
if [ "$CONFLICTS" -gt 0 ] ; then
   echo "There is conflict in vision_opencv. Aborting"
   return 1
fi

BRANCH=master
echo "---------------------------------------------------------------------------"
echo "--------------------------pull realsense-ros-------------------------------"
echo "---------------------------------------------------------------------------"
cd ~/project_hand/catkin_ws/src/sensors/realsense-ros
git checkout 2.2.15
git pull

CONFLICTS=$(git ls-files -u | wc -l)
if [ "$CONFLICTS" -gt 0 ] ; then
   echo "There is conflict in realsense-ros. Aborting"
   return 1
fi

cd ~/project_hand/
return 0
