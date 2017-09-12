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
    # sf-lab-net
    10.16.0.0:
      netmask: 255.255.240.0
      routers: 10.16.0.1
      allow:
        - unknown-clients
      domain-name-servers:
        - 8.8.8.8
        - 208.67.222.222

      pools:
        lab_pool:
          default-lease-time: 3600
          max-lease-time: 3600
          range:
            - 10.16.0.128
            - 10.16.0.191
  hosts:
    # Test machines
    gravelpit:
      hardware: ethernet 52:54:00:ff:00:0b
      fixed-address: gravelpit.internal.sifive.com
    # Regression machines
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
    # Lab machines
    nuc1:
      hardware: ethernet f4:4d:30:61:c2:49
      fixed-address: nuc1.internal.sifive.com
    nuc3:
      hardware: ethernet f4:4d:30:6c:dd:00
      fixed-address: nuc3.internal.sifive.com
    mnuc00:
      hardware: ethernet 94:c6:91:11:4b:c6
      fixed-address: mnuc00.internal.sifive.com
    turtle:
      hardware: ethernet 00:0a:cd:29:9e:45
      fixed-address: turtle.internal.sifive.com
    tortoise:
      hardware: ethernet 68:05:ca:3d:a7:23
      fixed-address: tortoise.internal.sifive.com
    terrapin:
      hardware: ethernet 68:05:ca:2d:95:c3
      fixed-address: terrapin.internal.sifive.com
