network:
  interfaces:
    xn0:
      ip: 10.14.0.8
      netmask: 255.255.240.0
      tso: false

ssh:
  userconfig:
    root:
      github.com:
        User: git
        IdentitiesOnly: yes
      github-sifive-pxe:
        HostName: github.com
        IdentityFile: ~/.ssh/id_rsa.sifive-pxe
