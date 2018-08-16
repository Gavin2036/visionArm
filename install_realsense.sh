###############################
# INSTALL REALSENSE ON UBUNTU #
# SCRIPT by GAVIN GUO         #
###############################

## Installing the packages:
# 1. Register the server's public key :
sudo apt-key adv --keyserver keys.gnupg.net --recv-key C8B3A55A6F3EFCDE || sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key C8B3A55A6F3EFCDE
# In case the public key still cannot be retrieved, check and specify proxy settings: export http_proxy="http://<proxy>:<port>"
# , and rerun the command. See additional methods in the following link.


# 2. Add the server to the list of repositories :
#     Ubuntu 16 LTS:
sudo add-apt-repository "deb http://realsense-hw-public.s3.amazonaws.com/Debian/apt-repo xenial main" -u
#     Ubuntu 18 LTS:
# sudo add-apt-repository "deb http://realsense-hw-public.s3.amazonaws.com/Debian/apt-repo bionic main" -u


# When upgrading, remove the old records:
sudo rm -f /etc/apt/sources.list.d/realsense-public.list.
sudo apt-get update.

# In order to run demos install:
sudo apt-get install librealsense2-dkms
sudo apt-get install librealsense2-utils
# The above two lines will deploy librealsense2 udev rules, build and activate kernel modules, runtime library and executable demos and tools.

# Reconnect the Intel RealSense depth camera and run: realsense-viewer to verify the installation.

# Developers shall install additional packages:
sudo apt-get install librealsense2-dev
sudo apt-get install librealsense2-dbg
# With dev package installed, you can compile an application with librealsense using g++ -std=c++11 filename.cpp -lrealsense2 or an IDE of your choice.

# Verify that the kernel is updated :
# modinfo uvcvideo | grep "version:" should include realsense string

## Uninstalling the Packages:

# Important: Removing Debian package is allowed only when no other installed packages directly refer to it. For example removing librealsense2-udev-rules requires librealsense2 to be removed first.

# Remove a single package with:
# sudo apt-get --purge <package-name>

# Remove all RealSense™ SDK-related packages with:
# dpkg -l | grep "realsense" | cut -d " " -f 3 | xargs sudo dpkg --purge