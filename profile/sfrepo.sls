# Pillar config for the SiFive local repo

{% set sfrepo = { } %}
{% do sfrepo.update({'dir' : '/srv/www/sfrepo'}) %}
{% do sfrepo.update({'gnupghome' : '/srv/keys'}) %}

include:
  - profile.webserver
  
states:
  apache.vhosts.standard: true
  reprepro: true

apache:
  sites:
    sfrepo:
      enabled: True
      ServerName: sfrepo.internal.sifive.com
      ServerAdmin: help@sifive.com
      DocumentRoot: {{ sfrepo.dir }}

      Directory:
        {{ sfrepo.dir }}:
          Require: ip 10.14.0.0/16
          AllowOverride: None

reprepro:
  dir: {{ sfrepo.dir }}
  gnupghome: {{ sfrepo.gnupghome }}
  repos:
    sifive-xenial:
      subdir: sifive-xenial
      origin: SiFive
      label: SiFive Xenial
      codename: sifive-xenial
      architectures: i386 amd64 source
      components: main
      description: SiFive Xenial local repository
      signwith: pkgsigner
