#!/bin/bash

PUBLIC_HOSTNAME={{ domain_name }}

java -jar -Dopenvidu.secret="{{ openvidusecret }}" -Dopenvidu.recording=true -Dopenvidu.recording.public-access={{ FreeHTTPAccesToRecordingVideos }} -Dserver.ssl.enabled=false -Dopenvidu.publicurl=http://${PUBLIC_HOSTNAME}:{{ openvidu_port }} -Dserver.port=5443 -DMY_UID=$(id -u $USER) /opt/openvidu/openvidu-server.jar

