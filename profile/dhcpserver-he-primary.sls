# SiFive HE primary DHCP server

include:
  - profile.dhcpserver

dhcpd:
  listen-interfaces:
    - lo
  subnets:
    # sf-he-unix01-net
    10.14.16.0:
      netmask: 255.255.255.0
      routers: 10.14.16.1
      default-lease-time: 12960
      max-lease-time: 12960
      domain-name-servers: 
        - 10.14.16.38
        - 10.14.16.39
      pools:
        install_pool:
          default-lease-time: 600
          max-lease-time: 600
          next-server: tftpboot.internal.sifive.com
          range:
            - 10.14.16.224
            - 10.14.16.254
          allow:
            - members of "pxeclient"
            - members of "debinstall"
