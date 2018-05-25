# Create mkuser scsripts

include:
  - accounts.cluster-accounts

states:
  sfaccount.scripts: true

sfaccount:
  pillar: sfaccount:users
  ldap:
    binddn: 'cn=root,dc=sifive,dc=com'
    base_users: 'ou=people,dc=sifive,dc=com'
    base_groups: 'ou=groups,dc=sifive,dc=com'
  lookup:
    dir: /srv/newuser/sfaccount
    home: /home
    default_shell: /bin/bash
    default_domain: sifive.com
