# Hurricane Electric location values.

network:
  gateway: 10.14.16.1
  netmask: 255.255.255.0

  resolver:
    nameservers:
      - 10.14.0.3

chrony:
  server:
    - he-ntp0.internal.sifive.com
    - he-ntp1.internal.sifive.com
