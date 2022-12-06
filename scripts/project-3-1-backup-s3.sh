#!/bin/bash
ssh -T -i /home/jenkins/web-server.pem www-user@<test-server-ip> << EOF
cd /var/www/html/web
tar cfz /home/www-user/devops-project.tgz .
aws configure set default.s3.multipart_threshold 64MB
aws s3 cp /home/www-user/devops-project.tgz s3://swinburnedevops/devops-project.tgz
EOF
