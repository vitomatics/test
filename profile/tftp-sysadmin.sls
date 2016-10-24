# Pillar config for tftp server hosting sysadmin files.

states:
  tftpd: true

tftpd:
  lookup:
    directory: /srv/tftpboot
