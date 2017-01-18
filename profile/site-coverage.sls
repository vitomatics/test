# A website for serving static production testing coverage reports

{% set covdir = '/work/jenkins/coverage' %}
{% set certdir = '/etc/pki' %}
{% set cert = 'coverage' %}
{% set keysuffix = '.key' %}
{% set certsuffix = '.crt' %}
{% set caroot = 'ca' %}
{% set keyfile = certdir + '/' + cert + keysuffix %}
{% set certfile = certdir + '/' + cert + certsuffix %}
{% set cafile = certdir + '/' + caroot + certsuffix %}

states:
  apache.vhosts.standard: true
  apache.mod_vhost_alias: true
  apache.mod_ssl: true
  apache.config: true
  sfcert.certs: true

sfcert:
  lookup:
    certdir: {{ certdir }}
    keysuffix: {{ keysuffix }}
    certsuffix: {{ certsuffix }}
    caroot: {{ caroot }}
  ca:
    user: jenkins
    mode: '0600'
  certs:
    {{cert}}:
      cn: {{cert}}.internal.sifive.com
      user: jenkins
      mode: '0600'
  

apache:
  user: jenkins
  group: www-data
  sites:
    coverage:
      interface: '*'
      port: '443'
      enabled: true
      ServerName: coverage.internal.sifive.com
      ServerAdmin: help@sifive.com
      # Kind-of a hack so it does not try and create DocumentRoot
      VirtualDocumentRoot: {{ covdir }}
      DocumentRoot: false
      SSLCertificateFile: {{ certfile }}
      SSLCertificateKeyFile: {{ keyfile }}
      SSLCertificateChainFile: {{ cafile }}
      Directory:
        {{ covdir }}:
          Require: ip 10.14.0.0/16 10.17.0.0/16
          AllowOverride: None
          Options: +Indexes +SymLinksIfOwnerMatch
    coverage-redirect:
      ServerName: coverage.internal.sifive.com
      interface: '*'
      port: '80'
      enabled: true
      template_file: salt://apache/vhosts/redirect.tmpl

