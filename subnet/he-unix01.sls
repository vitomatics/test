# Hurricane Electric unix01 subnet

include:
  - location.he

states:
  network: true
  network.resolver: true

network:
  gateway: 10.14.16.1
  netmask: 255.255.255.0
  

  # Use resolvconf for nameservers
  resolver:
    nameservers:
      - 10.14.16.38
      - 10.14.16.39

chrony:
  server:
    - ntp0.internal.sifive.com
    - ntp1.internal.sifive.com
