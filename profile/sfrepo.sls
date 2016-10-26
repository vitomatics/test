# Pillar config for the SiFive local repo

{% set sfrepo['dir'] = '/srv/www/sfrepo' %}

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
      DocumentRoot: {{ sfrepo.dir }}

      Directory:
        {{ sfrepo.dir }}:
          Require: ip 10.14.0.0/16
          AllowOverride: None


