## pillar file for kerberos client

{% set server = 'vader.internal.sifive.com' %}
{% set realm = 'INTERNAL.SIFIVE.COM' %}

states:
  kerberos.client: true

kerberos:
  client:
    libdefaults:
      default_realm: {{ realm }}
      dns_lookup_kdc: 'false'
      forwardable: 'true'
      proxiable: 'true'
    realms:
      {{ realm }}:
        kdc: [ {{ server }} ]
        admin_server: {{ server }}


sssd:
  kerberos:
    realm: {{ realm }}
    kdc:
      - {{ server }}

