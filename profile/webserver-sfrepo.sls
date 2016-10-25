# Pillar config for tftp server hosting sysadmin files.

states:
  apache: true

apache:
  lookup:
    version: '2.4'
    
  name_virtual_hosts:
    - interface: '*'
      port: 80

  sites:
    sfrepo:
      enable: True
      ServerName: sfrepo.internal.sifive.com
      ServerAdmin: help@sifive.com
      DocumentRoot: /srv/www/sfrepo

      Directory:
        /srv/www/sfrepo:
          Order: Deny,Allow
          Deny: from all
          Allow: from 10.14
          AllowOverride: None
