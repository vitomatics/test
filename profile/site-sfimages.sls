# A website for serving the sifive image files

{% set sfimagedir = '/srv/images' %}
{% set sfgroup = 'sysadmin' %}
{% set ips = '10.14.0.0/16 10.134.0.0/16' %}

states:
  apache.vhosts.standard: true

file:
  mkdir:
    {{ sfimagedir }}:
      user: root
      group: {{ sfgroup }}
      mode: '02775'     # setuid group

apache:
  sites:
    sfimages:
      enabled: True
      ServerName: sfimages.internal.sifive.com
      ServerAdmin: help@sifive.com
      DocumentRoot: {{ sfimagedir }}

      Directory:
        {{ sfimagedir }}:
          Require: ip {{ ips }}
          AllowOverride: None
          Options: +Indexes

