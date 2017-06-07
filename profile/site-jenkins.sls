# A proxy to access the jenkins server on 8080

{% set site = 'jenkins2' %}
{% set domain = 'internal.sifive.com' %}
{% set servername = site + '.' + domain %}
{% set sitedir = '/srv/www/' + site %}
{% set ips = '10.14.0.0/16 10.17.0.0/16' %}

{% set certdir = '/etc/pki' %}
{% set cert = site %}
{% set keysuffix = '.key' %}
{% set certsuffix = '.crt' %}
{% set caroot = 'ca' %}
{% set keyfile = certdir + '/' + cert + keysuffix %}
{% set certfile = certdir + '/' + cert + certsuffix %}
{% set cafile = certdir + '/' + caroot + certsuffix %}


states:
  apache.vhosts.standard: true
  apache.no_default_vhost: true
  apache.mod_ssl: true
  apache.mod_proxy: true
  apache.mod_proxy_http: true
  apache.mod_headers: true

sfcert:
  lookup:
    certdir: {{ certdir }}
    keysuffix: {{ keysuffix }}
    certsuffix: {{ certsuffix }}
    caroot: {{ caroot }}
  ca:
    user: root
    mode: '0600'
  certs:
    {{cert}}:
      cn: {{cert}}.internal.sifive.com
      user: root
      mode: '0600'


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
      SSLCertificateFile: {{ certfile }}
      SSLCertificateKeyFile: {{ keyfile }}
      SSLCertificateChainFile: {{ cafile }}
      template_file: salt://apache/vhosts/proxy.tmpl
      ProxyRequests: 'Off'
      Proxy_control:
        '*':
          AllowAll: True
      Formula_Append: |
        RequestHeader set X-Forwarded-Proto "https"
        RequestHeader set X-Forwarded-Port "443"
        AllowEncodedSlashes NoDecode
        ProxyPass         / http://localhost:8080/ nocanon
	ProxyPassReverse  / http://localhost:8080/
	ProxyPassReverse  / http://jenkins2.internal.sifive.com

