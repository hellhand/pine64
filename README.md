--- Pine 64 image builder

These files can be used to build a scratch image for the pine 64, this is meant for Ubuntu.
There are two versions
* lite
* normal

- Lite version

This version is only the base image with only the main repository active. Only openssh-server and sudo are setup.
The user is ubuntu:ubuntu.

- Normal version

It has the same base as the lite but has all repositories active. In additions to openssh-server and sudo, these features are also installed docker.io, zsh and git.
This image is mostly destined to run docker containers.


-- Docker

The minimal image can be used to create docker containers, as it is targetted for arm64 it should be more efficient than armhf counterparts.


-- How-to

First we will create a linux image that will be our rootfs. You will have to run either build.sh or build-lite.sh depending on your case, to do so you have to tell the script which version you want to use. 

Here with xenial :
 $build.sh xenial

You should now have a file called xenial-rootfs# pine64
