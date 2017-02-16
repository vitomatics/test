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

{% if grains.os == 'Ubuntu' %}
file:
  ln:
    /bin/sh: bash
{% endif %}

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
          grains.osmajorrelease if (grains.os == 'Debian') else grains.osrelease,
          grains.osarch, '2016.11']|join('/') %}
        uri: http://{{saltsite}}
        suite: {{ suite }}
        key_url: https://{{saltsite}}/SALTSTACK-GPG-KEY.pub

{#
      sifive:
        {% set sfrepo = 'http://sfrepo.internal.sifive.com' %}
        uri: {{sfrepo}}
        suite: sifive-{{suite}}
        key_url: {{sfrepo}}/SIFIVE-GPG-KEY.pub
#}

  list:
    krb5-user: true
    
    htop: true
    iftop: true
    sysstat: true
    dstat: true

    gdb: true
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
    smartmontools: true
    mcelog: true
    sssd-tools: true
    kpartx: true

    screen: true
    tmux: true
    mailutils: true

    zsh: true
    tcsh: true
    vim: true
    rsync: true
    pdsh: true
    rpm: true
    alien: true

    build-essential: true
    make: true
    git: true

    wcalc: true
    apcalc: true
    emacs-nox: true

    python-m2crypto: true
    
    # This is a dependency on some Ubuntu hosts - this makes it consistent
    {% if grains.os == 'Ubuntu' %}
    s-nail: true
    {% endif %}

# If there is a firewall then leave ssh open
firewall:
  ports:
    tcp:
      22: 10.0.0.0/8

      
boot:
  grub:
    serial:
      port: 0
