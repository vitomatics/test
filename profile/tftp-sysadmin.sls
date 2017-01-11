# Pillar config for tftp server hosting sysadmin files.

states:
  tftpd: true

tftpd:
  lookup:
    directory: /srv/tftpboot

firewall:
  ports:
    udp:
      69: 10.0.0.0/8
