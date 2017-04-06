# Pillar config for caching name server with copies of local zones.
# Also uses an rpz zone for stuff that is behind the SiFive NAT that
# we also access from outside the NAT.

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
    default_zones: true
    options:
      dnssec-enable: yes
      dnssec-validation: auto
      masterfile-format: text
      allow-recursion:
        - sifive-clients
      allow-query:
        - sifive-clients
      allow-transfer:
        - none
      allow-update:
        - none
      response-policy:
        - zone "rpz"
  configured_acls:
    sifive-clients:
      - 10.14.0.0/16
      - 10.15.0.0/16
      - 10.17.0.0/16
      - 10.100.0.0/16
      - 10.101.0.0/16
      - localhost

  configured_zones:
    internal.sifive.com:
      type: slave
    14.10.in-addr.arpa:
      type: slave
    15.10.in-addr.arpa:
      type: slave
    rpz:
      type: slave
      allow-query:
        - localhost

  available_zones:
    internal.sifive.com:
      file: db.internal.sifive.com
      masters: "10.14.16.42;"
    14.10.in-addr.arpa:
      file: db.14.10
      masters: "10.14.16.42;"
    15.10.in-addr.arpa:
      file: db.15.10
      masters: "10.14.16.42;"
    rpz:
      file: db.rpz
      masters: "10.14.16.42;"

firewall:
  ports:
    tcp:
      53: 10.0.0.0/8
    udp:
      53: 10.0.0.0/8
