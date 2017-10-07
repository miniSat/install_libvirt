#!/bin/sh
#sudo ssh -i "ubuntu.pem" ubuntu@ec2-54-191-59-213.us-west-2.compute.amazonaws.com

log_file=lvinstall.log

#function installation for ubuntu
function for_ubuntu {
	echo $1
	apt-get install kvm -y &>> $log_file
	apt-get install qemu-kvm libvirt-bin -y &>> $log_file
	apt-get install virtinst -y &>> $log_file

}

#function installation for fedora
function for_fedora { 
	echo $1
	dnf install kvm -y &>> $log_file
	dnf install qemu-kvm python-virtinst libvirt libvirt-python virt-manager libguestfs-tools -y &>> $log_file
} 


distro=$(lsb_release -i | cut -f 2)
if [ $distro == "Fedora" ]
	then
	for_fedora hello_fedora
elfi [ $distro == "Ubuntu" ]
	then 
	for_ubuntu hello_ubuntu
