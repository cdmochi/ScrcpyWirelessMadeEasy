#!/bin/bash

#Start from beginning
adb kill-server
adb start-server

#Get your device IP address
  #devices expected only one
device_ip=`adb shell ip route | awk '{print $9}'`
read -a targetip <<< "$device_ip"
target=${targetip}
echo "Your Device IP is $target"

#Enable adb over tcp/ip
adb tcpip 5555
adb connect ${target}:5555
