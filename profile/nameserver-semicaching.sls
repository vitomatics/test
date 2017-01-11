# Pillar config for caching name server with copies of local zones.


states:
  bind: true
  bind.config: true

bind:
  config:
    default_zones: true
    options:
      masterfile-format: text
      allow-recursion:
        - sifive-clients
      allow-query:
        - sifive-clients
      allow-transfer:
        - none
      allow-update:
        - none
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
      masters: "10.14.0.4;"
    14.10.in-addr.arpa:
      file: db.14.10
      masters: "10.14.0.4;"
    15.10.in-addr.arpa:
      file: db.15.10
      masters: "10.14.0.4;"
    rpz:
      file: db.rpz
      masters: "10.14.0.4;"

firewall:
  ports:
    tcp:
      53: any
    udp:
      53: any
