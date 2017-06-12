## pillar file for kerberos master server

states:
  kerberos.master: true

kerberos:
  realms:
    INTERNAL.SIFIVE.COM:
      max_life: 12h 0m 0s
      key_stash_file: /etc/krb5kdc/.k5.INTERNAL.SIFIVE.COM
      databasae_name: /var/lib/krb5kdc/principal
      