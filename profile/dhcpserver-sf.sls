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
    nuc2:
      hardware: ethernet f4:4d:30:6a:94:8f
      fixed-address: nuc2.internal.sifive.com
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
    # labusb hosts
    labusb00:
      hardware: ethernet d4:6e:0e:06:6b:fb
      fixed-address: labusb00.internal.sifive.com
    labusb01:
      hardware: ethernet d4:6e:0e:0e:f3:a6
      fixed-address: labusb01.internal.sifive.com
    labusb02:
      hardware: ethernet d4:6e:0e:06:6c:23
      fixed-address: labusb02.internal.sifive.com
    labusb03:
      hardware: ethernet d4:6e:0e:05:ed:3a
      fixed-address: labusb03.internal.sifive.com
    # hifiveu boards
    hifiveu000:
      hardware: ethernet 70:b3:d5:92:f0:00
      fixed-address: hifiveu000.internal.sifive.com
    hifiveu001:
      hardware: ethernet 70:b3:d5:92:f0:01
      fixed-address: hifiveu001.internal.sifive.com
    hifiveu002:
      hardware: ethernet 70:b3:d5:92:f0:02
      fixed-address: hifiveu002.internal.sifive.com
    hifiveu003:
      hardware: ethernet 70:b3:d5:92:f0:03
      fixed-address: hifiveu003.internal.sifive.com
    hifiveu004:
      hardware: ethernet 70:b3:d5:92:f0:04
      fixed-address: hifiveu004.internal.sifive.com
    hifiveu005:
      hardware: ethernet 70:b3:d5:92:f0:05
      fixed-address: hifiveu005.internal.sifive.com
    hifiveu006:
      hardware: ethernet 70:b3:d5:92:f0:06
      fixed-address: hifiveu006.internal.sifive.com
    hifiveu007:
      hardware: ethernet 70:b3:d5:92:f0:07
      fixed-address: hifiveu007.internal.sifive.com
    hifiveu008:
      hardware: ethernet 70:b3:d5:92:f0:08
      fixed-address: hifiveu008.internal.sifive.com
    hifiveu009:
      hardware: ethernet 70:b3:d5:92:f0:09
      fixed-address: hifiveu009.internal.sifive.com
    hifiveu010:
      hardware: ethernet 70:b3:d5:92:f0:0a
      fixed-address: hifiveu010.internal.sifive.com
    hifiveu011:
      hardware: ethernet 70:b3:d5:92:f0:0b
      fixed-address: hifiveu011.internal.sifive.com
    hifiveu012:
      hardware: ethernet 70:b3:d5:92:f0:0c
      fixed-address: hifiveu012.internal.sifive.com
    hifiveu013:
      hardware: ethernet 70:b3:d5:92:f0:0d
      fixed-address: hifiveu013.internal.sifive.com
    hifiveu014:
      hardware: ethernet 70:b3:d5:92:f0:0e
      fixed-address: hifiveu014.internal.sifive.com
    hifiveu015:
      hardware: ethernet 70:b3:d5:92:f0:0f
      fixed-address: hifiveu015.internal.sifive.com
    hifiveu016:
      hardware: ethernet 70:b3:d5:92:f0:10
      fixed-address: hifiveu016.internal.sifive.com
    hifiveu017:
      hardware: ethernet 70:b3:d5:92:f0:11
      fixed-address: hifiveu017.internal.sifive.com
    hifiveu018:
      hardware: ethernet 70:b3:d5:92:f0:12
      fixed-address: hifiveu018.internal.sifive.com
    hifiveu019:
      hardware: ethernet 70:b3:d5:92:f0:13
      fixed-address: hifiveu019.internal.sifive.com
    hifiveu020:
      hardware: ethernet 70:b3:d5:92:f0:14
      fixed-address: hifiveu020.internal.sifive.com
    hifiveu021:
      hardware: ethernet 70:b3:d5:92:f0:15
      fixed-address: hifiveu021.internal.sifive.com
    hifiveu022:
      hardware: ethernet 70:b3:d5:92:f0:16
      fixed-address: hifiveu022.internal.sifive.com
    hifiveu023:
      hardware: ethernet 70:b3:d5:92:f0:17
      fixed-address: hifiveu023.internal.sifive.com
    hifiveu024:
      hardware: ethernet 70:b3:d5:92:f0:18
      fixed-address: hifiveu024.internal.sifive.com
