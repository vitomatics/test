# Pillar config for the SiFive local repo

{% set sfrepo = { } %}
{% do sfrepo.update({'aptlydir' : '/srv/aptly'}) %}
{% do sfrepo.update({'repodir' : '/srv/aptly/repos'}) %}
{% do sfrepo.update({'pkgdir' : '/srv/aptly/pkgs'}) %}
{% do sfrepo.update({'gnupghome' : '/srv/keys'}) %}

{% set suite = 'xenial' %}

include:
  - secret.sfrepo

states:
  apache.vhosts.standard: true
  aptly.create_repos: true
  aptly.create_mirrors: true
  aptly.publish_repos: true

pkgs:
  apt:
    repos:
      sifive:
        uri: http://sandbox.internal.sifive.com/
        suite: {{ suite }}
        comps: [ 'main' ]

apache:
  sites:
    sfrepo:
      enabled: True
      ServerName: sandbox.internal.sifive.com
      ServerAdmin: help@sifive.com
      DocumentRoot: {{ sfrepo.repodir }}/public/sifive

      Directory:
        {{ sfrepo.repodir }}/public/sifive:
          Require: ip 10.14.0.0/16
          AllowOverride: None

aptly:
  homedir: {{ sfrepo.aptlydir }}
  rootdir: {{ sfrepo.repodir }}
  architectures:
    - amd64
    - source
  mirrors:
    stanford-backports:
      url: http://exodus.stanford.edu/debian-stanford
      distribution: xenial-backports
      components:
        - main
      architectures:
        - amd64
        - source
      prefix: "stanford-backports-main"
  repos:
    sifive:
      prefix: sifive
      distributions:
        - xenial
      components:
        - main
      comment: "SiFive Xenila packages"
      pkgdir: {{ sfrepo.pkgdir }}/sifive
      remove_files: false




{#####

## The reprepro version

{% set sfrepo = { } %}
{% do sfrepo.update({'wwwdir' : '/srv/www/sfrepo'}) %}
{% do sfrepo.update({'repodir' : '/srv/reprepro/sfrepo'}) %}
{% do sfrepo.update({'pkgdir' : '/srv/reprepro/sfrepo'}) %}
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
