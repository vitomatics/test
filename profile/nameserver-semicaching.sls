# Pillar config for caching name server with copies of local zones.


states:
  bind: true
  bind.config: true

bind:
  config:
    default_zones: true
    options:
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
      - 10.15.0.0/16
      - 10.17.0.0/16
      - localhost

firewall:
  ports:
    tcp:
      53: any
    udp:
      53: any
