# A website for serving static production testing coverage reports

{% set covdir = '/work/jenkins/coverage' %}

states:
  apache.vhosts.standard: true

apache:
  sites:
    coverage:
      enabled: True
      ServerName: coverage.internal.sifive.com
      ServerAdmin: help@sifive.com
      VirtualDocumentRoot: {{ covdir }}

      Directory:
        {{ covdir }}:
          Require: ip 10.14.0.0/16 10.17.0.0/16
          AllowOverride: None

