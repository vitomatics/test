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

pam:
  su:
    wheelgroup: wheel
    
{% if grains.os == 'Ubuntu' %}
file:
  ln:
    /bin/sh: bash
{% endif %}

{% set sfrepo = 'http://sfrepo.internal.sifive.com' %}
{% set offsiterepo = 'http://us.archive.ubuntu.com' %}
{% set offsiterepo2 = 'http://security.ubuntu.com' %}
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
        list: saltstack
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
      # Our local ubuntu repos
      # Need to list components separately otherwise the salt state does
      # a bad job of reconciling with existing repos
      ubuntu:
        uri: {{sfrepo}}/ubuntu/canonical
        suite: {{ suite }}
        comps: [ 'main' ]
        key_url: {{sfrepo}}/public.gpg
      ubuntu-restricted:
        uri: {{sfrepo}}/ubuntu/canonical
        suite: {{ suite }}
        comps: [ 'restricted']
        key_url: {{sfrepo}}/public.gpg
      ubuntu-universe:
        uri: {{sfrepo}}/ubuntu/canonical
        suite: {{ suite }}
        comps: [ 'universe']
        key_url: {{sfrepo}}/public.gpg
      ubuntu-multiverse:
        uri: {{sfrepo}}/ubuntu/canonical
        suite: {{ suite }}
        comps: [ 'multiverse']
        key_url: {{sfrepo}}/public.gpg
      ubuntu-updates:
        uri: {{sfrepo}}/ubuntu/canonical
        suite: {{ suite }}-updates
        comps: [ 'main' ]
        key_url: {{sfrepo}}/public.gpg
      ubuntu-updates-restricted:
        uri: {{sfrepo}}/ubuntu/canonical
        suite: {{ suite }}-updates
        comps: [ 'restricted']
        key_url: {{sfrepo}}/public.gpg
      ubuntu-updates-universe:
        uri: {{sfrepo}}/ubuntu/canonical
        suite: {{ suite }}-updates
        comps: [ 'universe']
        key_url: {{sfrepo}}/public.gpg
      ubuntu-updates-multiverse:
        uri: {{sfrepo}}/ubuntu/canonical
        suite: {{ suite }}-updates
        comps: [ 'multiverse']
        key_url: {{sfrepo}}/public.gpg
      ubuntu-security:
        uri: {{sfrepo}}/ubuntu/canonical
        suite: {{ suite }}-security
        comps: [ 'main' ]
        key_url: {{sfrepo}}/public.gpg
      ubuntu-security-restricted:
        uri: {{sfrepo}}/ubuntu/canonical
        suite: {{ suite }}-security
        comps: [ 'restricted' ]
        key_url: {{sfrepo}}/public.gpg
      ubuntu-security-universe:
        uri: {{sfrepo}}/ubuntu/canonical
        suite: {{ suite }}-security
        comps: [ 'universe' ]
        key_url: {{sfrepo}}/public.gpg
      ubuntu-security-multiverse:
        uri: {{sfrepo}}/ubuntu/canonical
        suite: {{ suite }}-security
        comps: [ 'multiverse' ]
        key_url: {{sfrepo}}/public.gpg
      ubuntu-backports:
        uri: {{sfrepo}}/ubuntu/canonical
        suite: {{ suite }}-backports
        comps: [ 'main' ]
        key_url: {{sfrepo}}/public.gpg
      ubuntu-backports-restricted:
        uri: {{sfrepo}}/ubuntu/canonical
        suite: {{ suite }}-backports
        comps: [ 'restricted']
        key_url: {{sfrepo}}/public.gpg
      ubuntu-backports-universe:
        uri: {{sfrepo}}/ubuntu/canonical
        suite: {{ suite }}-backports
        comps: [ 'universe' ]
        key_url: {{sfrepo}}/public.gpg
      ubuntu-backports-multiverse:
        uri: {{sfrepo}}/ubuntu/canonical
        suite: {{ suite }}-backports
        comps: [ 'multiverse' ]
        key_url: {{sfrepo}}/public.gpg

      sifive:
        list: sifive
        uri: {{sfrepo}}/ubuntu/sifive
        suite: {{suite}}-sifive
        comps: [ 'main' ]
        key_url: {{sfrepo}}/public.gpg

      # Repos we do not want
      offsite:
        absent: true
        uri: {{offsiterepo}}/ubuntu/
        suite: {{ suite }}
        comps: [ 'main' ]
      offsite-restricted:
        absent: true
        uri: {{offsiterepo}}/ubuntu/
        suite: {{ suite }}
        comps: [ 'restricted']
      offsite-universe:
        absent: true
        uri: {{offsiterepo}}/ubuntu/
        suite: {{ suite }}
        comps: [ 'universe']
      offsite-multiverse:
        absent: true
        uri: {{offsiterepo}}/ubuntu/
        suite: {{ suite }}
        comps: [ 'multiverse']
      offsite-updates:
        absent: true
        uri: {{offsiterepo}}/ubuntu/
        suite: {{ suite }}-updates
        comps: [ 'main' ]
      offsite-updates-restricted:
        absent: true
        uri: {{offsiterepo}}/ubuntu/
        suite: {{ suite }}-updates
        comps: [ 'restricted']
      offsite-updates-universe:
        absent: true
        uri: {{offsiterepo}}/ubuntu/
        suite: {{ suite }}-updates
        comps: [ 'universe']
      offsite-updates-multiverse:
        absent: true
        uri: {{offsiterepo}}/ubuntu/
        suite: {{ suite }}-updates
        comps: [ 'multiverse']
      offsite-security:
        absent: true
        uri: {{offsiterepo2}}/ubuntu
        suite: {{ suite }}-security
        comps: [ 'main' ]
      offsite-security-restricted:
        absent: true
        uri: {{offsiterepo2}}/ubuntu
        suite: {{ suite }}-security
        comps: [ 'restricted' ]
      offsite-security-universe:
        absent: true
        uri: {{offsiterepo2}}/ubuntu
        suite: {{ suite }}-security
        comps: [ 'universe' ]
      offsite-security-multiverse:
        absent: true
        uri: {{offsiterepo2}}/ubuntu
        suite: {{ suite }}-security
        comps: [ 'multiverse' ]
      offsite-backports:
        absent: true
        uri: {{offsiterepo}}/ubuntu/
        suite: {{ suite }}-backports
        comps: [ 'main' ]
      offsite-backports-restricted:
        absent: true
        uri: {{offsiterepo}}/ubuntu/
        suite: {{ suite }}-backports
        comps: [ 'restricted']
      offsite-backports-universe:
        absent: true
        uri: {{offsiterepo}}/ubuntu/
        suite: {{ suite }}-backports
        comps: [ 'universe' ]
      offsite-backports-multiverse:
        absent: true
        uri: {{offsiterepo}}/ubuntu/
        suite: {{ suite }}-backports
        comps: [ 'multiverse' ]
      {% endif %}  {# on Ubuntu #}

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
    wsmancli: true
    amtterm: true
    
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
    libgcc1:i386: true

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
