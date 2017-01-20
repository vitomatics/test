# SF DHCP config

include:
  - location.sf

# Pull DNS from DHCP
network:
  resolver:
    nameservers: []


chrony:
  server:
    - sf-ntp0.internal.sifive.com
    - he-ntp0.internal.sifive.com
