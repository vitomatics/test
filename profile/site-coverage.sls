# A website for serving static production testing coverage reports

include:
  - profile.webserver.system_auth


{% set site = 'coverage' %}
{% set user = 'jenkins' %}
{% set covdir = '/work/jenkins/coverage' %}
{% set certdir = '/etc/pki' %}
{% set cert = site %}
{% set keysuffix = '.key' %}
{% set certsuffix = '.crt' %}
{% set caroot = 'ca' %}
{% set keyfile = certdir + '/' + cert + keysuffix %}
{% set certfile = certdir + '/' + cert + certsuffix %}
{% set cafile = certdir + '/' + caroot + certsuffix %}
{% set sitedir = '/srv/' + site %}
{% set passwdfile = sitedir + '/' + site + '.htpasswd' %}

states:
  apache.vhosts.standard: true
  apache.mod_vhost_alias: true
  apache.mod_ssl: true
  sfcert.certs: true

# sfcert:
#   lookup:
#     certdir: {{ certdir }}
#     keysuffix: {{ keysuffix }}
#     certsuffix: {{ certsuffix }}
#     caroot: {{ caroot }}
#   ca:
#     user: {{ user }}
#     mode: '0600'
#   certs:
#     {{cert}}:
#       cn: {{cert}}.internal.sifive.com
#       user: {{user}}
#       mode: '0600'

file:
  mkdir:
    {{ sitedir }}:
      user: root
      group: root
      mode: '0755'
  file:
    {{ passwdfile }}:
      user: {{ user }}
      mode: '0400'
      makedirs: true
      contents:
        - sifive:$apr1$XAJYmbSG$.2ZJfST1UYK3K6b9ehAdr0

apache:
  user: {{ user }}
  group: www-data
  sites:
    coverage:
      interface: '*'
      port: '443'
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
          AllowOverride: None
          Options: +Indexes +SymLinksIfOwnerMatch
          Require: false
          Formula_Append: |
            AuthType Basic
            AuthName "SiFive Coverage"
            AuthBasicProvider file
            AuthUserFile "{{passwdfile}}"
            <RequireAll>
              Require valid-user
              Require ip 10.14.0.0/16 10.17.0.0/16
            </RequireAll>

    coverage-redirect:
      ServerName: coverage.internal.sifive.com
      DocumentRoot: false
      interface: '*'
      port: '80'
      template_file: salt://apache/vhosts/redirect.tmpl


{#
## how we used basic authn with system passwords and system group authz
apache:
  sites:
    whatever:
      port: '443'
      Formula_Append: |
        AddExternalAuth pwauth /usr/sbin/pwauth
        SetExternalAuthMethod pwauth pipe
      Directory:
        /whatever:
          Formula_Append: |
            AuthType Basic
            AuthName "SiFive Coverage"
            AuthBasicProvider external
            AuthExternal pwauth
            <RequireAll>
              Require unix-group compute
              Require ip 10.14.0.0/16 10.17.0.0/16
            </RequireAll>

#}
