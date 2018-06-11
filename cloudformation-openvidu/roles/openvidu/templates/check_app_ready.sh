#!/bin/bash 

sleep 1m

while true
do 
  HTTP_STATUS=$(curl -Ik http://localhost:{{ openvidu_port }} | head -n1 | awk '{print $2}')
  if [ $HTTP_STATUS == 401 ]; then
    break
  fi
  sleep 1
done

