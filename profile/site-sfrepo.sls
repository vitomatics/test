# Pillar config for the SiFive local repo

{% set sfrepo = { } %}
{% set ips = '10.14.0.0/16 10.134.0.0/16' %}
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
          Require: ip {{ ips }}
          AllowOverride: None

aptly:
  homedir: {{ sfrepo.aptlydir }}
  rootdir: {{ sfrepo.repodir }}
  secure: true
  
  architectures:
    - i386
    - amd64
    - source
  mirrors:
    stanford-backports:
      url: http://exodus.stanford.edu/debian-stanford
      key_url: http://sfimages.internal.sifive.com/Stanford/keys/stanford-keyring.gpg
      distribution: xenial-backports
      components:
        - main
      architectures:
        - amd64
      prefix: "stanford-backports-main"
    xenial:
      url: http://mirrors.ocf.berkeley.edu/ubuntu
      key_url: http://mirrors.ocf.berkeley.edu/ubuntu/project/ubuntu-archive-keyring.gpg
      distribution: xenial
      components:
        - main
        - multiverse
        - restricted
        - universe
      architectures:
        - amd64
        - i386
      prefix: "xenial"
    xenial-updates:
      url: http://mirrors.ocf.berkeley.edu/ubuntu
      key_url: htp://sfimages.internal.sifive.com/Ubuntu/keys/trusted.gpg
      distribution: xenial-updates
      components:
        - main
        - multiverse
        - restricted
        - universe
      architectures:
        - amd64
        - i386
      prefix: "xenial-updates"
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
