# Hurricane Electric unix01 subnet

include:
  - location.he

network:
  nameservers: [ ]
  

  # Use resolvconf for nameservers
  resolver:
    nameservers:
      - 10.14.16.38
      - 10.14.16.39

chrony:
  server:
    - he-ntp0.internal.sifive.com
    - he-ntp1.internal.sifive.com
