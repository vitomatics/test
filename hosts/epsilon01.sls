## pillar file for epsilon01

include:
  - hosts.epsilon

# Make sure we do not try and use ethlab as our route to the outside world
network:
  interfaces:
    ethtest:
      ip: 10.16.1.81
      netmask: 255.255.240.0
      gateway:
