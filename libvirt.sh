#!/bin/sh
#sudo ssh -i "ubuntu.pem" ubuntu@ec2-54-191-59-213.us-west-2.compute.amazonaws.com

log_file=lvinstall.log

function check {
	package=$1
	result=$(dnf -q list installed libvirt &>/dev/null && echo "Installed" || echo "Not installed")
	if [ "$result" == "Installed" ]
		then
			#echo "if"
			echo "$package already installed."
	elif [ "$result" == "Not installed" ]
		then
			echo "$package is installing"
			dnf install $package -y
		fi	
}


#function installation for ubuntu
function for_ubuntu {
	echo $1
	apt-get install kvm -y &>> $log_file
	apt-get install qemu-kvm libvirt-bin -y &>> $log_file
	apt-get install virtinst -y &>> $log_file
 	apt-get install virt-manager -y &>> $log_file
}



#function installation for fedora
function for_fedora { 
	#echo $1
	
	check libvirt

} 


distro=$(lsb_release -i | cut -f 2)
if [ "$distro" == "Fedora" ]
	then
	for_fedora hello_fedora
elif [ "$distro" == "Ubuntu" ]
	then 
	for_ubuntu hello_ubuntu
fi