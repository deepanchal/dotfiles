#!/bin/bash
MyBatteryCharge=`sudo tlp-stat --battery | grep Charge | grep = | awk '{print $3}'`

if (( $(echo "$MyBatteryCharge > 80" |bc -l) )); then
  notify-send "Battery" "Hey, this is your battery talking: I'm charged above the 80% threshold"
fi
