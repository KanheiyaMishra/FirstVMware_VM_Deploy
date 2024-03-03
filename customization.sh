#!/bin/sh
if [ x$1 == x"precustomization" ]; then
  echo Do Precustomization tasks
elif [ x$1 == x"postcustomization" ]; then
  echo "***************************************************************************">/etc/motd
  hostname | cut -d. -f1 | xargs figlet -f big >> /etc/motd
  echo -e '\t \t\t NOTICE TO USERS'>>/etc/motd
  echo "Authorized uses only. All activity may be monitored and reported.">>/etc/motd
  echo "***************************************************************************">>/etc/motd
  echo -e '\t \t\t To get root access use "sudo sudosh -" '>>/etc/motd
  echo "***************************************************************************">>/etc/motd
  echo -n 'RmFkdkAyMDE4Iw==' | base64 -d | adcli join --verbose --domain=noam.fadv.net --os-name="CentOS Linux" --os-version=7 -O "OU=APP,OU=Linux,OU=ServerSystems,OU=FADV,DC=NOAM,DC=FADV,DC=NET" -U sa-ansmgr-noam --stdin-password
  authconfig --enablesssd --enablesssdauth --passalgo=sha512 --update
  systemctl stop nscd
  systemctl enable rpcbind.service
  systemctl stop rpcbind.service
  systemctl start rpcbind.service
  systemctl disable nscd
  systemctl enable autofs
  systemctl start autofs
  systemctl status autofs
  systemctl enable sssd
  systemctl start sssd
  systemctl status sssd
  hostnamectl set-hostname $(hostname).noam.fadv.net
fi
