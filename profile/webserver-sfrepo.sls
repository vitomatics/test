# Pillar config for tftp server hosting sysadmin files.

states:
  apache: true
  apache.no_default_vhost: true
  apache.vhosts.standard: true

apache:
  lookup:
    version: '2.4'
    
  name_virtual_hosts:
    - interface: '*'
      port: 80

  sites:
    sfrepo:
      enabled: True
      ServerName: sfrepo.internal.sifive.com
      ServerAdmin: help@sifive.com
      DocumentRoot: /srv/www/sfrepo

      Directory:
        /srv/www/sfrepo:
	  Require: ip 10.14.0.0/16
          AllowOverride: None
