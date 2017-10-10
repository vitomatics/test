# HE DHCP config

include:
  - location.he

states:
  network: true
  network.resolver: true


# Pull DNS from DHCP
network:
  resolver:
    nameservers: []


chrony:
  server:
    - he-ntp0.internal.sifive.com
    - he-ntp1.internal.sifive.com
