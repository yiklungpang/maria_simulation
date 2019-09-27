# Maria Simulation
This is a catkin workspace containing the simulation environment for the Maria robot.

## Prerequisites
You will need the following software installed on your machine:
- ROS Kinetic
- Gazebo 8
- RViz
- MoveIt!

## Getting Started
First clone the catkin workspace

`git clone https://github.com/yiklungpang/maria_simulation.git`

Once the repository is downloaded, run
```
cd maria_simulation
catkin_make
source devel/setup.bash
```
## Data Collection
This is a simple example for moving the UR5 arm and taking RGB and point cloud images from the Kinect

You can start the data collection process by running:

`roslaunch experiment data_collection.launch`

The UR5 arm will move to the center of the table and the Kinect will take RGB and point cloud images

RGB images and PCD files of point clouds will be saved in:

`maria_simulation/src/experiment/kinect_data`
