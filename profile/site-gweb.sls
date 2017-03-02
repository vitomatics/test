# A website for serving ganglia content

{% set site = 'gweb' %}

{# This is a hack and only works for Debian-ish but no way to get this info #}
{# from the module #}
{% set sitedir = '/usr/share/ganglia-webfrontend' %}

states:
  apache.vhosts.standard: true
  ganglia.webfrontend: true

apache:
  sites:
    {{site}}:
      enabled: True
      ServerName: sandbox.internal.sifive.com
      ServerAdmin: help@sifive.com
      DocumentRoot: {{ sitedir }}
      Directory:
        {{ sitedir }}:
          Require: ip 10.14.0.0/16
          AllowOverride: All
      
