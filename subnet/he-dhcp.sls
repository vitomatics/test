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
    - he-rack1-ntp.internal.sifive.com
    - he-rack2-ntp.internal.sifive.com
