# A website for general install-time stuff

{% set site = 'install' %}
{% set domain = 'internal.sifive.com' %}
{% set servername = site + '.' + domain %}
{% set sitedir = '/srv/www/' + site %}
{% set ips = '10.14.0.0/16 10.134.0.0/16' %}
{% set group = 'sysadmin' %}
{% set bindir = '/srv/www/bin' %}

states:
  apache.vhosts.standard: true

file:
  mkdir:
    {{ bindir }}:
      user: root
      group: root
      mode: '0775'
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

rsyncdirs:
  xenial-installer-amd64:
    src: rsync://mirrors.ocf.berkeley.edu/ubuntu/dists/xenial-updates/main/installer-amd64/
    dest: {{ sitedir }}/xenial-installboot/installer-amd64
    user: root
    group: {{ group }}
    mode: '0775'
    script: {{ bindir }}/update-xenial-installboot
    

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
