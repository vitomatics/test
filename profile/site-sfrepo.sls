# Pillar config for the SiFive local repo

{% set sfrepo = { } %}
{% do sfrepo.update({'wwwdir' : '/srv/www/sfrepo'}) %}
{% do sfrepo.update({'aptlydir' : '/srv/aptly'}) %}
{% do sfrepo.update({'repodir' : '/srv/aptly/sfrepo'}) %}
{% do sfrepo.update({'publicdir' : '/srv/aptly/sfrepo/public'}) %}
{% do sfrepo.update({'gnupghome' : '/srv/keys'}) %}


include:
  - secret.sfrepo

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

aptly:
  homedir: {{ sfrepo.aptlydir }}
  rootdir: {{ sfrepo.repodir }}
  architectures:
    - amd64
    - source
  repos:
    sfrepo:
      components:
        - main
      distributions:
        - xenial
      comment: "SiFive repo"
      pkgdir: /srv/aptly/pkgs




{#####

## The reprepro version

{% set sfrepo = { } %}
{% do sfrepo.update({'wwwdir' : '/srv/www/sfrepo'}) %}
{% do sfrepo.update({'repodir' : '/srv/reprepro/sfrepo'}) %}
{% do sfrepo.update({'gnupghome' : '/srv/keys'}) %}



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
  keys:
    pkgsigner:
      keyname: keys:pkgsigner
      keyfile: SIFIVE-GPG-KEY.pub
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
      packages:
        /srv/images/nomachine/deb/nomachine-terminal-server-evaluation_5.1.54_2_amd64.deb

#}
