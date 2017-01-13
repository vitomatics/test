# pillar file for SF-based machines

location:
  short: HE

chrony:
  server:
    - he-ntp0.internal.sifive.com
    - he-ntp1.internal.sifive.com

network:
  nameservers:
    - 10.14.0.3
