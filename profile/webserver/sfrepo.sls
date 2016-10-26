# Pillar config for web server holding the SiFive repo.

include:
  - profile.webserver
  
states:
  apache.vhosts.standard: true

apache:
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
