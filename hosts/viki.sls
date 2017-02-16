## pillar file for viki

states:
  firewall.iptables: true

disksetup:
  dirs:
    /srv/salt:
      user: root
      group: root
      mode: '0755'
  


