## pillar file for epsilon06

include:
  - hosts.epsilon

# Make sure we do not try and use ethlab as our route to the outside world
network:
  gateway: 10.14.0.1
  interfaces:
    ethtest:
      ip: 10.16.1.22
      netmask: 255.255.240.0
      gateway:
