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
	- localhost
      allow-query:
        - sifive-clients
	- localhost
      allow-transfer:
        - none
      allow-update:
        - none
  configured_acls:
    sifive-clients:
      - sifive-compute
      - sifive-admin
      - sifive-laptop
      - localhost
    sifive-compute:
      - 10.14.0.0/16
    sifive-admin:
      - 10.15.0.0/16
    sifive-laptop:
      - 10.17.0.0/16

firewall:
  ports:
    tcp:
      53: any
    udp:
      53: any
