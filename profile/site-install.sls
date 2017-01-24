# A website for general install-time stuff

{% set site = 'install' %}
{% set domain = 'internal.sifive.com' %}
{% set servername = site + '.' + domain %}
{% set sitedir = '/srv/www/' + site %}
{% set ips = '10.14.0.0/16' %}
{% set group = 'sysadmin' %}

states:
  apache.vhosts.standard: true

file:
  mkdir:
    {{ sitedir }}:
      user: root
      group: {{ group }}
      mode: '0775'
    {{ sitedir }}/preseed:
      user: root
      group: {{ group }}
      mode: '0775'
    {{ sitedir }}/sysresccd:
      user: root
      group: {{ group }}
      mode: '0775'
    {{ sitedir }}/memtest86:
      user: root
      group: {{ group }}
      mode: '0775'

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
