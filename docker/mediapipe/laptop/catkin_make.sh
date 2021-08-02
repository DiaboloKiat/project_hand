touch ./catkin_ws/src/bodyparts_ros/CATKIN_IGNORE
touch ./catkin_ws/src/egohands_ros/CATKIN_IGNORE
touch ./catkin_ws/src/ggcnn_humanseg_ros/CATKIN_IGNORE

# vision_opencv
catkin_make --pkg vision_opencv -C ./catkin_ws \
    -DCMAKE_BUILD_TYPE=Release \
    -DPYTHON_EXECUTABLE=/usr/bin/python3 \
    -DPYTHON_INCLUDE_DIR=/usr/include/python3.6m \
    -DPYTHON_LIBRARY=/usr/lib/x86_64-linux-gnu/libpython3.6m.so

catkin_make -C ./catkin_ws

source $HOME/project_hand/catkin_ws/devel/setup.bash
cd ~/project_hand