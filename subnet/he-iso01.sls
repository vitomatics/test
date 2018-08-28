# Hurricane Electric iso01 subnet

include:
  - location.he

states:
  network: true
  network.resolver: true

network:
  gateway: 10.134.16.1
  netmask: 255.255.255.0
  

  # Use resolvconf for nameservers
  resolver:
    nameservers:
      - 10.14.16.38
      - 10.14.16.39

chrony:
  server:
    - he-rack1-ntp.internal.sifive.com
    - he-rack2-ntp.internal.sifive.com
