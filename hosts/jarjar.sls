## pillar file for jarjar

states:
  firewall.iptables: true

## Temporary firewall for xilinux flexnet setup
firewall:
  ports:
    tcp:
      2100: 10.14.0.0/16 10.134.0.0/16
      2101: 10.14.0.0/16 10.134.0.0/16
