#!/bin/sh
#sudo ssh -i "ubuntu.pem" ubuntu@ec2-54-191-59-213.us-west-2.compute.amazonaws.com

log_file=lvinstall.log

function check {
	if  yum list installed "$@" >/dev/null 2>&1 
	then
		#echo "if"
		echo "$@ already installed."
	else
		echo "$@ is installing"
		dnf install $@ -y
	fi	
}

#function installation for fedora
function for_fedora { 
	#echo $1
	#check qemu-kvm
	#check qemu-img
	check libvirt
	check virt-install
	check virt-manager
} 


distro=$(lsb_release -i | cut -f 2)
if [ "$distro" == "Fedora" ]
	then
	for_fedora hello_fedora
elif [ "$distro" == "Ubuntu" ]
	then 
	for_ubuntu hello_ubuntu
fi
