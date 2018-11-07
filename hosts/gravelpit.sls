## pillar file for gravelpit

{% import_yaml "accounts/allgroups.yml" as allgroups %}

# network - dhcp

states:
  firewall.iptables: true

