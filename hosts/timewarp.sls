## pillar file for timewarp

# network - dhcp

states:
  firewall.iptables: true

firewall:
  ports:
    tcp:
      80: 10.14.0.0/16
      443: 10.14.0.0/16
      8080: 10.14.0.0/16
