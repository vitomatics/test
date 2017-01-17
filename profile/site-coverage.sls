# A website for serving static production testing coverage reports

{% set covdir = '/work/jenkins/coverage' %}

states:
  apache.vhosts.standard: true
  apache.mod_vhost_alias: true

apache:
  user: jenkins
  group: www-data
  sites:
    coverage:
      enabled: True
      ServerName: coverage.internal.sifive.com
      # Kind-of a hack so it does not try and create DocumentRoot
      VirtualDocumentRoot: {{ covdir }}
      DocumentRoot: false

      Directory:
        {{ covdir }}:
          Require: ip 10.14.0.0/16 10.17.0.0/16
          AllowOverride: None
          Options: +Indexes +SymLinksIfOwnerMatch

