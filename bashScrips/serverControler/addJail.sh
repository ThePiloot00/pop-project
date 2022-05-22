#!/bin/bash
##run met chmod +s voor elevatet priveliges
iocage create -n $1 -r 11.2-RELEASE  dhcp="on" boot="on"