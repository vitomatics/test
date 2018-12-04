## pillar file for epsilon06

include:
  - hosts.epsilon


network:
  interfaces:
    ethtest:
      ip: 10.16.1.86
      netmask: 255.255.240.0
      gateway:
