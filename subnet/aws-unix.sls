# AWS Unix subnet

include:
  - location.aws

states:
  # Leave the main network config to aws
  network.resolver: true
  # Leave the console stuff to EC2
  boot.grub: false

network:
  # Use resolvconf for nameservers
  resolver:
    nameservers:
      - 10.14.16.38
      - 10.14.16.39

chrony:
  server:
    - he-ntp0.internal.sifive.com
    - he-ntp1.internal.sifive.com
