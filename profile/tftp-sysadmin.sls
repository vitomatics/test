# Pillar config for tftp server hosting sysadmin files.

states:
  tftpd: true

tftpd:
  lookup:
    directory: /srv/tftpboot
    options: --secure --blocksize 1300

firewall:
  ports:
    udp:
      69: 10.14.0.0/16 10.15.0.0/16 10.100.0.0/16 10.101.0.0/16 10.134.0.0/16
