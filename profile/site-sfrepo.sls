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


apache:
  sites:
    sfrepo:
      enabled: true
      ServerName: sfrepo.internal.sifive.com
      ServerAdmin: help@sifive.com
      DocumentRoot: {{ sfrepo.repodir }}/public

      Directory:
        {{ sfrepo.repodir }}/public:
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
      prefix: "stanford-backports-main"
  repos:
    ubuntu-sifive:
      prefix: ubuntu/sifive
      distributions:
        - xenial
      components:
        - main
      comment: "SiFive Ubuntu Xenial packages"
      pkgdir: {{ sfrepo.pkgdir }}/ubuntu/sifive
      remove_files: false
