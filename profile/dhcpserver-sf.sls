# SiFive SF DHCP server

include:
  - profile.dhcpserver

dhcpd:
  listen-interfaces:
    - lo
  domain-name-servers: 
    - 10.14.0.14
    - 10.14.16.39
  subnets:
    # sf-unix-net
    10.14.0.0:
      netmask: 255.255.240.0
      routers: 10.14.0.1
      allow:
        - unknown-clients
      ntp-servers:
        - 10.14.0.14
        - 10.14.16.39

      pools:
        install_pool:
          default-lease-time: 600
          max-lease-time: 600
          next-server: tftpboot.internal.sifive.com
          range:
            - 10.14.3.225
            - 10.14.3.254
          allow:
            - members of "pxeclient"
            - members of "debinstall"



  hosts:
    gravelpit:
      hardware: ethernet 52:54:00:ff:00:0b
      fixed-address: gravelpit.internal.sifive.com
    nuc3:
      hardware: ethernet f4:4d:30:6c:dd:00
      fixed-address: nuc3.internal.sifive.com
      next-server: tftpboot.internal.sifive.com
