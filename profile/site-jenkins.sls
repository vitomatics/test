# A proxy to access the jenkins server on 8080

{% set site = 'jenkins2' %}
{% set domain = 'internal.sifive.com' %}
{% set servername = site + '.' + domain %}
{% set sitedir = '/srv/www/' + site %}
{% set ips = '10.14.0.0/16 10.17.0.0/16' %}

states:
  apache.vhosts.standard: true
  apache.no_default_vhost: true
  apache.mod_proxy: true
  apache.mod_proxy_http: true


apache:
  sites:
    {{ site }}-redirect:
      ServerName: {{ servername }}
      DocumentRoot: false
      interface: '*'
      port: '80'
      template_file: salt://apache/vhosts/redirect.tmpl
    {{ site }}:
      interface: '*'
      port: '443'
      ServerName: {{ servername }}
      ServerAdmin: help@sifive.com
      DocumentRoot: false
      Formula_Append: |
	'AllowEncodedSlashes NoDecode'
        'ProxyPass / http://localhost:8080/ nocanon'
        'ProxyPassReverse / http://localhost:8080/'
        'ProxyRequests Off'

# AddExternalAuth  pwauth /usr/sbin/pwauth
# SetExternalAuthMethod pwauth pipe
