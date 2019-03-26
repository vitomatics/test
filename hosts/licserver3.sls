## pillar file for host licserver3


states:
  firewall.iptables: true

firewall:
  ports:
    tcp:
      1885: 10.14.0.0/16 10.17.0.0/16
      1886: 10.14.0.0/16 10.17.0.0/16
      9319: 10.14.0.0/16 10.17.0.0/16
      27020: 10.14.0.0/16 10.17.0.0/16
      27021: 10.14.0.0/16 10.17.0.0/16



