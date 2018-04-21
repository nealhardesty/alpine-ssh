#!/bin/sh
set -x
if [ ! $(id "$USERNAME" >> /dev/null 2>&1) ]; then
  echo Creating user $USERNAME
  adduser -D "$USERNAME"
  echo "$USERNAME:$PASSWORD" | chpasswd
fi

ssh-keygen -A 

exec /usr/sbin/sshd -D -e 
