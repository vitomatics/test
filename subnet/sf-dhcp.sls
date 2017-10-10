# SF DHCP config

include:
  - location.sf

states:
  network: true
  network.resolver: true

# Pull DNS from DHCP
network:
  resolver:
    nameservers: []


chrony:
  server:
    - sf-ntp0.internal.sifive.com
    - he-ntp0.internal.sifive.com
