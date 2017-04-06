# Pillar config for authoritative name server.

states:
  bind: true
  bind.config: true

file:
  mkdir:
    /etc/bind/DIR_MANAGED_BY_SIFIVE_SALT:
      user: root
      group: root
      mode: '0444'

bind:
  config:
    default_zones: false
    options:
      dnssec-enable: yes
      dnssec-validation: auto
      masterfile-format: text
      allow-recursion: [ ]
      allow-query:
        - sifive-auth-testclients
      allow-transfer:
        - sifive-nameservers
      allow-update:
        - none
  configured_acls:
    sifive-nameservers:
      - 10.14.0.0/16
    sifive-auth-testclients:
      - 10.14.0.0/16
      - localhost

  configured_zones:
    internal.sifive.com:
      type: master
{#
    14.10.in-addr.arpa:
      type: master
    15.10.in-addr.arpa:
      type: master
    rpz:
      type: master
#}

  available_zones:
    internal.sifive.com:
      file: internal.sifive.com.zone
      pillar: site.nameserver.internal_sifive_com
{#
    14.10.in-addr.arpa:
      file: 14.10.zone
    15.10.in-addr.arpa:
      file: 15.10.zone
    rpz:
      file: rpz.zone
#}

firewall:
  ports:
    tcp:
      53: 10.14.0.0/16
    udp:
      53: 10.14.0.0/16
