#!/usr/bin/env python
# Software License Agreement (BSD License)
#
# Copyright (c) 2008, Willow Garage, Inc.
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
#
#  * Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
#  * Redistributions in binary form must reproduce the above
#    copyright notice, this list of conditions and the following
#    disclaimer in the documentation and/or other materials provided
#    with the distribution.
#  * Neither the name of Willow Garage, Inc. nor the names of its
#    contributors may be used to endorse or promote products derived
#    from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
# FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
# COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
# INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
# BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
# LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
# ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.
#
# Author: Yik Lung Pang

""" Simple Movement
Move the UR5 arm and take an RGB and point cloud image
"""

import copy
import json
import moveit_commander
import moveit_msgs.msg
import os
import random
import rospy
import rospkg
import sys
import tf
from experiment.srv import *
from gazebo_msgs.srv import DeleteModel, SpawnModel, GetModelState
from geometry_msgs.msg import *
from sensor_msgs.msg import PointCloud2, Image
from std_msgs.msg import String
from math import pi


def main(req):
    """Main function to perform the experiment and record the effects

    Parameters
    ----------
    req : list of str
        The list of tools and objects names

    """
    rospy.loginfo('-------------------------------------------------')
    rospy.loginfo('Starting simple movement')
    rospy.loginfo('-------------------------------------------------')

    # Initialise moveit_commander
    moveit_commander.roscpp_initialize(sys.argv)

    # Interface to the group of joints belonging to the left UR5 arm
    group_name = 'left_arm'
    group = moveit_commander.MoveGroupCommander(group_name)
    
    # Move arm to middle of the table
    move_arm(group, 0.00, 0.35, 1.025)

    # Record 2D visuals
    record_rgb()
    # Record 3D visuals
    record_pc()

    # Return experiment status
    return SimpleMovementResponse('Finished')

def perform_experiment_server():
    """Set up the server for the record visual service

    """

    # Initiate this node
    rospy.init_node('simple_movement_server', anonymous=True)
    s = rospy.Service('simple_movement', SimpleMovement, main)

    # keep node running
    rospy.spin()



def move_arm(group, pos_x, pos_y, pos_z):
    """Move the arm

    Parameters
    ----------
    group : MoveGroupCommander
        MoveGroupCommander of the arm to be controlled
    pos_x : target x coordinate
        X coordinate of target position
    pos_y : target y coordinate
        y coordinate of target position
    pos_z : target z coordinate
        z coordinate of target position

    """

    # Define waypoint
    startpose = group.get_current_pose().pose
    startpose.position.x = pos_x
    startpose.position.y = pos_y
    startpose.position.z = pos_z

    # Compute and execute path
    plan,_ = group.compute_cartesian_path([startpose], 0.01, 0.0)
    group.execute(plan, wait=True)
    group.stop()


def record_rgb():
    """Recording 2D visuals

    """

    # Get the RGB image from the Kinect sensor
    # Note: There are issues with wait_for_message not getting the
    # most up to date message from /camera/rgb/image_raw.
    # This is a hack to wait for the updated message
    current_time = rospy.get_rostime()
    orig_rgb = rospy.wait_for_message('/camera/rgb/image_raw', Image)
    while orig_rgb.header.stamp < current_time:
        orig_rgb = rospy.wait_for_message('/camera/rgb/image_raw', Image)

    # Copy the recevied Image message to a new Image message
    copy_rgb = Image()
    copy_rgb.header = orig_rgb.header
    copy_rgb.height = orig_rgb.height
    copy_rgb.width = orig_rgb.width
    copy_rgb.encoding = orig_rgb.encoding
    copy_rgb.is_bigendian = orig_rgb.is_bigendian
    copy_rgb.step = orig_rgb.step
    copy_rgb.data = orig_rgb.data

    # Publish the new Image to be saved with the specific name
    rgb_pub = rospy.Publisher('rgb_image', Image, queue_size=1)
    rospy.loginfo('-------------------------------------------------')
    rospy.loginfo('Generating RGB')
    rospy.loginfo('-------------------------------------------------')
    rospy.sleep(3)
    rgb_pub.publish(copy_rgb)


def record_pc():
    """Recording 3D visuals

    """

    # Copy the recevied PointCloud2 message to a new PointCloud2 message
    orig_pc = rospy.wait_for_message('/camera/depth/points', PointCloud2)
    copy_pc = PointCloud2()
    copy_pc.header = orig_pc.header
    copy_pc.height = orig_pc.height
    copy_pc.width = orig_pc.width
    copy_pc.fields = orig_pc.fields
    copy_pc.is_bigendian = orig_pc.is_bigendian
    copy_pc.point_step = orig_pc.point_step
    copy_pc.row_step = orig_pc.row_step
    copy_pc.data = orig_pc.data
    copy_pc.is_dense = orig_pc.is_dense

    # Publish the new PointCloud2 to be saved with the specific name
    pc_pub = rospy.Publisher('pointcloud', PointCloud2, queue_size=10)
    rospy.loginfo('-------------------------------------------------')
    rospy.loginfo('Generating PCD')
    rospy.loginfo('-------------------------------------------------')
    rospy.sleep(3)
    pc_pub.publish(copy_pc)


def get_model_pose(object_name):
    """Get the position of an object

    Parameters
    ----------
    object_name : str
        The name of the object

    Returns
    ----------
    pose : dictionary
        dictionary containing the x, y and z position of the object
    """

    # Call service get_model_state
    get_model_state = rospy.ServiceProxy('/gazebo/get_model_state', GetModelState)
    try:
        coordinates = get_model_state(object_name, 'world')
        # Return position as dictionary
        pose = {
            "x": coordinates.pose.position.x,
            "y": coordinates.pose.position.y,
            "z": coordinates.pose.position.z
        }
        return pose
    except rospy.ServiceException, e:
        print "Service call failed: %s"%e

## Main function
if __name__ == '__main__':
    try:
        perform_experiment_server()
    except rospy.ROSInterruptException:
        pass
