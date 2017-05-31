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
  apache.mod_headers: true


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
      Timeout: 100
      Location:
        'asdf':
          Allow: whatever
          Formula_Append: |
            AuthType Basic
            AuthName sifive_jenkins
            AuthBasicProvider external
            AuthExternal pwauth
            Require unix-group compute
      template_file: salt://apache/vhosts/proxy.tmpl
      AllowEncodedSlashes: NoDecode
      ProxyRequests: 'Off'
      ProxyRoute:
        jenkins_proxy:
          ProxyPassSource: '/'
          ProxyPassTarget: 'http://localhost:8080'
          ProxyPassTargetOptions: 'nocanon'
          ProxyPassReverseSource: '/'
          ProxyPassReverseTarget: 'http://localhost:8080'
{#
      Proxy_control:
        '*':
          AllowAll: True
#}
      Formula_Append: |
        AddExternalAuth  pwauth /usr/sbin/pwauth
        SetExternalAuthMethod pwauth pipe
        RequestHeader set X-Forwarded-Proto "https"
        RequestHeader set X-Forwarded-Port "443"

