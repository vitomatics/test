## pillar file for kerberos master server

states:
  kerberos.master: true

kerberos:
  realms:
    INTERNAL.SIFIVE.COM:
      max_life: 12h 0m 0s