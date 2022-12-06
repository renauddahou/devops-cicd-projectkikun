#!/bin/bash
echo "" > /home/jenkins/asg_instance_ip_address.txt
rm /home/jenkins/asg_instance_ip_address.txt
for i in `aws Auto Scaling describe-auto-scaling-groups --auto-scaling-group-name "DevOps-Project-ASG" --region ap-southeast-1 | grep -i instanceid  | awk '{ print $2}' | cut -d',' -f1| sed -e 's/"//g'`
do
aws ec2 describe-instances --instance-ids $i --region ap-southeast-1 | grep -i PrivateIpAddress | awk '{ print $2 }' | head -1 | cut -d"," -f1 | tr -d '"' >> /home/jenkins/asg_instance_ip_address.txt
done;
cat /home/jenkins/asg_instance_ip_address.txt | while read ip
do
        ssh-keyscan -H $ip >> ~/.ssh/known_hosts
        ssh -T -i /home/jenkins/web-server.pem www-user@$ip << EOF
        cd /var/www/html/web
        git pull
        exit
EOF
done
