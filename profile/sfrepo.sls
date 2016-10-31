# Pillar config for the SiFive local repo

{% set sfrepo = { } %}
{% do sfrepo.update({'wwwdir' : '/srv/www/sfrepo'}) %}
{% do sfrepo.update({'repodir' : '/srv/repos/sfrepo'}) %}
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
      DocumentRoot: {{ sfrepo.wwwdir }}

      Directory:
        {{ sfrepo.wwwdir }}:
          Require: ip 10.14.0.0/16
          AllowOverride: None

reprepro:
  dir: {{ sfrepo.repodir }}
  wwwdir: {{ sfrepo.wwwdir }}
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
