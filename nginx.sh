#!/bin/bash

#sleep until cloud-init is completed (instance is ready).
while [ ! -f /var/lib/cloud/instance/boot-finished ]; do
  sleep 1
done

#install nginx
sudo amazon-linux-extras install -y nginx1
sudo systemctl start nginx
sudo systemctl enable nginx

