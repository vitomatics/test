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
        kdc: [ kdc0.internal.sifive.com ]
	admin_server: kdc0.internal.sifive.com
