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
      
        regular_pool:
          default-lease-time: 7200
          max-lease-time: 7200
          range:
            - 10.14.3.10
            - 10.14.3.224
          deny:
            - members of "pxeclient"
            - members of "debinstall"

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


    # sf-laptop-net
    10.17.0.0:
      netmask: 255.255.240.0
      routers: 10.17.0.1
      allow:
        - unknown-clients
      ntp-servers:
        - 10.14.0.14
        - 10.14.16.39
      pools:
        laptop_pool:
          default-lease-time: 7200
          max-lease-time: 7200
          range:
            - 10.17.0.16
            - 10.17.0.254

  hosts:
    gravelpit:
      hardware: ethernet 52:54:00:ff:00:0b
      fixed-address: gravelpit.internal.sifive.com
    nuc1:
      hardware: ethernet f4:4d:30:61:c2:49
      fixed-address: nuc1.internal.sifive.com
      next-server: tftpboot.internal.sifive.com
    printer01:
      hardware: ethernet b0:5a:da:c7:d0:99
      fixed-address: printer01.internal.sifive.com
    promptuary:
      hardware: ethernet d0:50:99:01:3a:55
      fixed-address: promptuary.internal.sifive.com
