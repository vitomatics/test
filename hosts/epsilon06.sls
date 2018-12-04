## pillar file for epsilon06

include:
  - hosts.epsilon

# test-net interface - must not have a gateway
network:
  interfaces:
    ethtest:
      ip: 10.16.1.86
      netmask: 255.255.240.0
      gateway:
