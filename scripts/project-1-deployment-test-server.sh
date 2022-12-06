#!/bin/bash
ssh -T -i /home/jenkins/web-server.pem www-user@<test-server-ip> << EOF
cd /var/www/html/web
git pull
EOF
