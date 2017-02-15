states:
  sflxc: true

network:
  interfaces:
    eth2:
      ip: 10.14.1.4

ssh:
  userconfig:
    eda:
      github.com:
        User: git
        IdentitiesOnly: yes
      github-sifive-modules:
        HostName: github.com
        IdentityFile: ~/.ssh/id_rsa.sifive-modules
