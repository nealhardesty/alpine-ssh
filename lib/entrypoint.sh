#!/bin/sh
if [ ! $(id "$USERNAME" >> /dev/null 2>&1) ]; then
  echo Creating user $USERNAME
  adduser -D "$USERNAME"
  echo "$USERNAME:$PASSWORD" | chpasswd

  echo Enabling sudo for $USERNAME
  echo "$USERNAME ALL=(ALL:ALL) ALL" >> /etc/sudoers
fi

ssh-keygen -A 

exec /usr/sbin/sshd -D -e 
