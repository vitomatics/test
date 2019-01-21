## pillar file for consul02

{% import_yaml "accounts/allgroups.yml" as allgroups %}

# network - dhcp

states:
  firewall.iptables: true

firewall:
  ports:
    tcp:
      8200: 10.14.0.0/16 10.17.0.0/16
      8500: 10.14.0.0/16 10.17.0.0/16
