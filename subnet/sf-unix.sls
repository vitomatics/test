# San Francisco unix subnet

include:
  - location/sf

network:
  gateway: 10.14.0.1
  netmask: 255.255.240.0

  resolver:
    nameservers:
      - 10.14.0.14
      - 10.14.16.39

chrony:
  server:
    - sf-ntp0.internal.sifive.com
    - he-ntp0.internal.sifive.com
