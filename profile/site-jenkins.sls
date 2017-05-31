# A proxy to access the jenkins server on 8080

{% set site = 'jenkins' %}
{% set domain = 'internal.sifive.com' %}
{% set servername = site + '.' + domain %}
{% set sitedir = '/srv/www/' + site %}
{% set ips = '10.14.0.0/16 10.17.0.0/16' %}

states:
  apache.vhosts.standard: true
  apache.no_default_vhost: true


apache:
  sites:
    {{ site }}:
      interface: '*'
      port: '80'
      ServerName: {{ servername }}
      ServerAdmin: help@sifive.com
      VirtualDocumentRoot: {{ sitedir }}
      AddExternalAuth: pwauth /usr/sbin/pwauth
      SetExternalAuthMethod: pwauth pipe

