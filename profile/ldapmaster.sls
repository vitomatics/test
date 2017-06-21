# Profile for master LDAP server

include:
  - secret.ldapmaster

{% set certdir = '/etc/pki' %}
{% set cert = 'sifive-ldap' %}
{% set keysuffix = '.key' %}
{% set certsuffix = '.crt' %}
{% set keyfile = certdir + '/' + cert + keysuffix %}
{% set certfile = certdir + '/' + cert + certsuffix %}


states:
  openldap.master: true
  apparmor: true

ldap:
  master:
    conf:
      base: dc=sifive,dc=com
      ssf: 128
      schemas:
        - core
        - cosine
        - inetorgperson
        - rfc2307bis
        - misc
      tlscert:
        cacertfile: {{ certfile }}
        # Note cacertfile is same file as certfile
        certfile: {{ certfile }}
        # cert in secret file
        keyfile: {{ keyfile }}
        # key in secret file
      RootDN: cn=root,dc=sifive,dc=com
      # RootPW in secret file


apparmor:
  usr.sbin.slapd:
    - '{{keyfile}} r,'
    - '{{certfile}} r,'
    - '/var/lib/sss/mc/initgroups r,'
    