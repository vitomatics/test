# Create mkuser scsripts

states:
  sfuser.scripts: true

sfuser:
  lookup:
    dir: /srv/newuser/sfuser
    default_home: /home
    default_shell: /bin/bash
    default_domain: sifive.com
