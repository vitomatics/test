ssh:
 userconfig:
    root:
      github.com:
        User: git
        IdentitiesOnly: yes
      github-salt-states:
        HostName: github.com
        IdentityFile: ~/.ssh/id_rsa.salt-states
      github-salt-pillar:
        HostName: github.com
        IdentityFile: ~/.ssh/id_rsa.salt-pillar
