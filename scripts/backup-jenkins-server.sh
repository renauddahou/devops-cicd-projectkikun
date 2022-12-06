#!/bin/bash
cd /var/lib/jenkins
tar cfz /home/jenkins/jenkins_backup.tgz .
aws configure set default.s3.multipart_threshold 64MB
aws s3 cp /home/jenkins/jenkins_backup.tgz s3://swinburnedevops/jenkins_backup.tgz
