# Profile for master LDAP server

include:
  - secret.ldapmaster

{% set certdir = '/etc/pki' %}
{% set cert = 'sifive-ldap' %}
{% set keysuffix = '.key' %}
{% set certsuffix = '.crt' %}
{% set keyfile = certdir + '/' + cert + keysuffix %}
{% set certfile = certdir + '/' + cert + certsuffix %}

{% set ldap_port = '389' %}
{% set ldap_clients = '10.14.0.0/16' %}


states:
  openldap.master: true
  apparmor: true
  firewall.iptables: true

ldap:
  master:
    conf:
      # WARNING - changing base rebuilds database
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
      # WARNING - changing RootDN rebuilds database
      RootDN: cn=root,dc=sifive,dc=com
      # RootPW in secret file


apparmor:
  usr.sbin.slapd:
    - '{{keyfile}} r,'
    - '{{certfile}} r,'
    - '/var/lib/sss/mc/initgroups r,'
    
firewall:
  ports:
    tcp:
      {{ ldap_port }}: {{ ldap_clients }}
