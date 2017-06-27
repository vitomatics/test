{% set suite = {
    'Debian': 'jessie',
    'Ubuntu': grains.oscodename,
  }[grains.os] %}

states:
  sysctl: true
  pkgs.apt: true
  boot.grub: true
  icsisnap: true
  chrony: true
  policyrc: true
  rsyslog: true

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

{% set sfrepo = 'http://sfrepo.internal.sifive.com' %}
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
        {% if grains.os == 'Debian' -%}
          {% set saltsite = [ 'repo.saltstack.com/apt', (grains.os|lower),
            grains.osmajorrelease, grains.osarch, '2016.11']|join('/') -%}
        {% else -%}
          {% set saltsite = 'sfrepo.internal.sifive.com/ubuntu/saltstack' -%}
        {% endif -%}
        suite: {{ suite }}
        key_url: http://sfimages.internal.sifive.com/Saltstack/keys/SALTSTACK-GPG-KEY.pub
        uri: http://{{saltsite}}

      {% if grains.os == 'Ubuntu' %}
      ubuntu:
        uri: {{sfrepo}}/ubuntu/canonical
        suite: {{ suite }}
        comps: [ 'main', 'restricted', 'universe', 'multiverse' ]
        key_url: {{sfrepo}}/public.gpg
      ubuntu-updates:
        uri: {{sfrepo}}/ubuntu/canonical
        suite: {{ suite }}-updates
        comps: [ 'main', 'restricted', 'universe', 'multiverse' ]
        key_url: {{sfrepo}}/public.gpg
      ubuntu-security:
        uri: {{sfrepo}}/ubuntu/canonical
        suite: {{ suite }}-security
        comps: [ 'main', 'restricted', 'universe', 'multiverse' ]
        key_url: {{sfrepo}}/public.gpg
      ubuntu-backports:
        uri: {{sfrepo}}/ubuntu/canonical
        suite: {{ suite }}-backports
        comps: [ 'main', 'restricted', 'universe', 'multiverse' ]
        key_url: {{sfrepo}}/public.gpg
      sifive:
        uri: {{sfrepo}}/ubuntu/sifive
        suite: {{suite}}-sifive
        comps: [ 'main' ]
        key_url: {{sfrepo}}/public.gpg
      {% endif %}

  list:
    krb5-user: true
    
    htop: true
    iftop: true
    sysstat: true
    dstat: true

    gdb: true
    strace: true
    lsof: true
    iotop: true

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
    {% if grains.os == 'Ubuntu' %}
    apparmor-utils: true
    {% endif %}

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
