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
    delta00:
      hardware: ethernet 94:c6:91:11:4c:d4
      fixed-address: delta00.internal.sifive.com
      next-server: tftpboot.internal.sifive.com
    delta01:
      hardware: ethernet 94:c6:91:10:6a:04
      fixed-address: delta01.internal.sifive.com
      next-server: tftpboot.internal.sifive.com
    delta02:
      hardware: ethernet 94:c6:91:10:66:6b
      fixed-address: delta02.internal.sifive.com
      next-server: tftpboot.internal.sifive.com
    delta03:
      hardware: ethernet 94:c6:91:10:69:5e
      fixed-address: delta03.internal.sifive.com
      next-server: tftpboot.internal.sifive.com
