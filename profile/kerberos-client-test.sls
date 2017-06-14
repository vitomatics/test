## pillar file for kerberos client

states:
  kerberos.client: true

kerberos:
  client:
    libdefaults:
      default_realm: INTERNAL.SIFIVE.COM
      dns_lookup_kdc: 'false'
      forwardable: 'true'
      proxiable: 'true'
    realms:
      INTERNAL.SIFIVE.COM:
        kdc: [ gravelpit.internal.sifive.com ]
        admin_server: gravelpit.internal.sifive.com


sssd:
  kerberos:
    realm: INTERNAL.SIFIVE.COM
    kdc:
      - gravelpit.internal.sifive.com

