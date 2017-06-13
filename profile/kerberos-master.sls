## pillar file for kerberos master server

states:
  kerberos.admin-server: true
  kerberos.kdc: true

kerberos:
  client:
    # This stuff should really be in kdc.conf but apparently that does not work
    appdefaults:
      strength:
        password_dictionary: /var/cache/cracklib/cracklib_dict
        minimum_length: 8
        minimum_different: 6
        require_classes: upper,lower,digit
        require_ascii_printable: 'true'
  server:
    realms:
      INTERNAL.SIFIVE.COM:
        max_life: 12h 0m 0s
        key_stash_file: /etc/krb5kdc/.k5.INTERNAL.SIFIVE.COM
        databasae_name: /var/lib/krb5kdc/principal
    plugins:
      pwqual:
        - strength: pwqual/strength.so
    logging:
      default: 'SYSLOG:INFO:AUTH'
    