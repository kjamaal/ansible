#!/bin/bash
set -x

curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-6.4.1-amd64.deb
sudo dpkg -i filebeat-6.4.1-amd64.deb
cat > /etc/filebeat/filebeat.yml <<EOF
filebeat.inputs:
- type: log
  enabled: true
  paths:
    - /var/log/ansible.log

output.elasticsearch:
  hosts: ["10.0.0.12:9200"]
EOF