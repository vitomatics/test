# Create mkuser scsripts

include:
  - accounts.cluster-accounts

states:
  sfaccount.scripts: true

sfaccount:
  lookup:
    dir: /srv/newuser/sfuser
    home: /home
    pillar: sfaccount:users
    default_shell: /bin/bash
    default_domain: sifive.com
