# A website for serving the sifive image files

{% set sfimagedir = '/srv/images' %}

apache:
  sites:
    sfimages:
      enabled: True
      ServerName: sfimages.internal.sifive.com
      ServerAdmin: help@sifive.com
      DocumentRoot: {{ sfimagedir }}

      Directory:
        {{ sfimagedir }}:
          Require: ip 10.14.0.0/16
          AllowOverride: None

