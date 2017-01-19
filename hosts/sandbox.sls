## pillar file for sandbox

# network - dhcp

states:
  sfdump.rsync: true
  chrony: true
  firewall.iptables: true


chrony:
  server:
    - he-ntp0.internal.sifive.com
    - he-ntp1.internal.sifive.com

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
