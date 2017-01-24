# A website for iPXE install menus

{% set site = 'pxe' %}
{% set domain = 'internal.sifive.com' %}
{% set servername = site + '.' + domain %}
{% set sitedir = '/srv/www/' + site %}
{% set ips = '10.14.0.0/16' %}

states:
  apache.vhosts.standard: true

file:
  mkdir:
    {{ sitedir }}:
      user: root
      group: root
      mode: '0755'

apache:
  sites:
    {{ site }}:
      interface: '*'
      port: '80'
      ServerName: {{ servername }}
      ServerAdmin: help@sifive.com
      DocumentRoot: {{ sitedir }}

      Directory:
        {{ sitedir }}:
          AllowOverride: None
          Require: ip {{ ips }}
	  Options: +Indexes
