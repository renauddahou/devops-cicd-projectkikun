#!/bin/bash
aws configure set default.s3.multipart_threshold 64MB
aws s3 cp s3://swinburnedevops/devops-project.tgz /var/www/html/devops-project.tgz
tar xfz /var/www/html/devops-project.tgz -C /var/www/html/web/
chown -Rf www-user:apache /var/www/html/web/
