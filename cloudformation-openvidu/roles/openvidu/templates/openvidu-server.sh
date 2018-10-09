#!/bin/bash

{% if reverse_proxy_enabled == "false" %}
PUBLIC_HOSTNAME={{ domain_name }}
{% elif whichcert == "letsencrypt" or whichcert == "owncert" %}
PUBLIC_HOSTNAME={{ domain_name }}
{% else %}
PUBLIC_HOSTNAME=$(curl http://169.254.169.254/latest/meta-data/public-hostname)
{% endif %}

PUBLIC_HOSTNAME={{ domain_name }}

java -jar -Dopenvidu.secret="{{ openvidusecret }}" -Dopenvidu.recording=true -Dopenvidu.recording.public-access={{ FreeHTTPAccesToRecordingVideos }} -Dserver.ssl.enabled=false -Dopenvidu.publicurl=https://${PUBLIC_HOSTNAME}:{{ openvidu_port }} -Dserver.port=5443 -DMY_UID=$(id -u $USER) /opt/openvidu/openvidu-server.jar

