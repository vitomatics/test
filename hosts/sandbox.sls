## pillar file for sandbox

# network - dhcp

states:
  sfdump.rsync: true
  chrony: true


network:
  resolver:
    nameservers:
      - 10.14.16.38
      - 10.14.16.39

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
  certs:
    coverage:
      cn: coverage.internal.sifive.com
      file:
        user: jenkins
        mode: '0600'
