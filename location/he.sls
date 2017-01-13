# pillar file for HE (Fremont) based machines

location:
  short: SF

chrony:
  server:
    - he-ntp0.internal.sifive.com
    - he-ntp1.internal.sifive.com

network:
  nameservers:
    - 10.14.16.38
    - 10.14.16.39
