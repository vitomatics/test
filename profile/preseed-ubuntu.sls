## SiFive preseed tree - Ubuntu

states:
  sfpreseed: true

sfpreseed:
  trees:
    ubuntu:
      dir: /srv/www/install/preseed/ubuntu
      url: http://install.internal.sifive.com/preseed/ubuntu
      saltrepo: repo.saltstack.com/apt/ubuntu/16.04/amd64/2016.11
      saltmaster: salt.internal.sifive.com
      salthash: sha256
      disthost: mirrors.kernel.org
      distdir: /ubuntu
      distsuite: xenial
      subnets:
        sf-static:
          static: true
          gateway: 10.14.0.1
          nameservers: 10.14.0.14 10.14.16.39
          ntpservers: he-ntp0.internal.sifive.com he-ntp1.internal.sifive.com
          domain: internal.sifive.com
        he1-static:
          static: true
          gateway: 10.14.16.1
          nameservers: 10.14.16.38 10.14.16.39
          ntpservers: he-ntp0.internal.sifive.com he-ntp1.internal.sifive.com
          domain: internal.sifive.com
        he1-dynamic:
          static: false
          ntpservers: he-ntp0.internal.sifive.com he-ntp1.internal.sifive.com
          domain: internal.sifive.com
      hosts:
        nuc1:
          ipaddress: 10.11.12.13
          subnet: sf-static
          diskname: /dev/sda
          diskmethod: crypto
        sandbox:
          ipaddress: 10.14.16.36
          subnet: he1-static
          serial: '0'
          baudrate: '115200'
          diskname: /dev/vda
          diskmethod: lvm
