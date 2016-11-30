network:
  interfaces:
    eth2:
      ip: 10.14.1.4

autofs:
  direct:
    /sifive: localhost:/export/sifive

ssh:
  userconfig:
    eda:
      github.com:
        User: git
        IdentitiesOnly: yes
      github-sifive-modules:
        HostName: github.com
        IdentityFile: ~/.ssh/id_rsa.sifive-modules
