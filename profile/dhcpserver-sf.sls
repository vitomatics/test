# SiFive SF DHCP server

include:
  - profile/dhcpserver.sls

dhcpd:
  listen-interfaces:
    - lo
  subnets:
    # sf-unix-net
    10.14.0.0:
      netmask: 255.255.240.0
      allow: unknown-clients
      routers: 10.14.0.1
      domain-name-servers: 
        - 10.14.0.14
        - 10.14.16.39
      ntp-servers:
        - 10.14.0.14
        - 10.14.16.39
      pools:
        regular_pool:
          range:
            - 10.14.3.10
            - 10.14.3.224
          deny:
            - members of "pxeclient"
            - members of "debinstall"
        install_pool:
          default-lease-time: 180
          max-lease-time: 360
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
      domain-name-servers: 
        - 10.14.0.14
        - 10.14.16.39
      allow: uknown-clients
      pools:
        laptop_pool:
          default-lease-time: 3600
          max-lease-time: 3600
          range:
            - 10.17.0.16
            - 10.17.0.254
