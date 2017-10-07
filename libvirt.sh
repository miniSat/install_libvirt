#!/bin/sh
#sudo ssh -i "ubuntu.pem" ubuntu@ec2-54-191-59-213.us-west-2.compute.amazonaws.com

log_file=lvinstall.log

#function installation for ubuntu
function for_ubuntu {
	echo $1
}

#function installation for fedora
function for_fedora { 
	echo $1
}



distro=$(lsb_release -i | cut -f 2)
if [ $distro == "Fedora" ]
	then
	for_fedora hello_fedora
elfi [ $distro == "Ubuntu" ]
	then 
	for_ubuntu hello_ubuntu
