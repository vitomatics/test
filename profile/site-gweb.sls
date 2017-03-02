# A website for serving ganglia content

{% set site = 'gweb' %}
{% set sitedir = '/srv/www/' + site %}

states:
  apache.vhosts.standard: true
  ganglia.webfrontend: true

apache:
  sites:
    gweb:
      enabled: True
      ServerName: sandbox.internal.sifive.com
      ServerAdmin: help@sifive.com
      DocumentRoot: {{ sitedir }}
      Directory:
        {{ sitedir }}:
          Require: ip 10.14.0.0/16
          AllowOverride: None
      
