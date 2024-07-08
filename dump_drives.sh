#!/bin/bash
#
#from parted:
#/dev/sda (120GB)
#
#
drives=('/dev/sda' '/dev/sdb' '/dev/sdc' '/dev/sdd' '/dev/sde' '/dev/sdf' '/dev/sdg' '/dev/sdh')

for a in "${drives[@]}";do
	echo "###############" >> drives
	echo "$a" >> drives
	smartctl -i $a >> drives
	echo "###############" >> drives
done
