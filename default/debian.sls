{% set suite = {
    'Debian': 'jessie',
    'Ubuntu': grains.oscodename,
  }[grains.os] %}

states:
  sysctl: true
  pkgs.apt: true
  boot.grub: true
  icsisnap: true

nss:
  group:
    wheel:
      gid: 11
      system: true
  sources:
    automount:
      - ldap

pkgs:
  apt:
    repos:
      {% if grains.os == 'Debian' %}
      backports:
        uri: http://ftp.debian.org/debian
        suite: {{ suite }}-backports
        comps: [ 'main', 'contrib', 'non-free' ]
      {% endif %}

      saltstack:
        {% set saltsite = [ 'repo.saltstack.com/apt', (grains.os|lower),
          grains.osrelease, grains.osarch, 'latest']|join('/') %}
        uri: http://{{saltsite}}
        suite: {{ suite }}
        key_url: https://{{saltsite}}/SALTSTACK-GPG-KEY.pub

  list:
    htop: true
    iftop: true
    sysstat: true

    strace: true
    lsof: true

    telnet: true
    mtr-tiny: true
    tcpdump: true
    socat: true
    tftp-hpa: true

    dnsutils: true
    ipmitool: true
    traceroute: true
    lsscsi: true
    gdisk: true
    bridge-utils: true

    screen: true
    tmux: true

    zsh: true
    vim: true
    rsync: true
    git: true
    pdsh: true

    wcalc: true
    apcalc: true
    emacs-nox: true

boot:
  grub:
    serial:
      port: 0
