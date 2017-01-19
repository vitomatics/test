## pillar file for sandbox

# network - dhcp

states:
  sfdump.rsync: true
  firewall.iptables: true


sfcert:
  country: US
  state: California
  city: San Francisco
  organization: SiFive Inc
  ca:
    cn: ca.internal.sifive.com
    group: www-data
  certs:
    coverage:
      cn: coverage.internal.sifive.com
      user: jenkins
      mode: '0600'
