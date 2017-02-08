## SiFive preseed tree - Ubuntu

states:
  sfpreseed: true

sfpreseed:
  disklayouts:
    compute_disk:
      swap:
        size: 17176
      boot:
        size: 1074
        filesystem: ext4
      parts:
        root:
          mountpoint: /
          size: 34352
          options:
            - noatime
        var:
          mountpoint: /var
          size: 17176
          options:
            - nodev
            - relatime
        scratch:
          mountpoint: /scratch
          size: unlimited
          options:
            - nodev
            - nosuid
            - noatime
    vm_small_disk:
      swap:
        size: 4294
      boot:
        size: 1074
        filesystem: ext4
      parts:
        root:
          mountpoint: /
          filesystem: ext4
          size: unlimited
          options:
            - noatime
    vm_med_disk:
      swap:
        size: 12882
      boot:
        size: 1074
        filesystem: ext4
      parts:
        root:
          mountpoint: /
          filesystem: ext4
          size: unlimited
          options:
            - noatime
    gamma_disk:
      swap:
        size: 14173
      boot:
        size: 1074
        filesystem: ext4
      parts:
        root:
          mountpoint: /
          size: 549756
          filesystem: ext4
          options:
            - noatime
        var:
          mountpoint: /var
          size: 34360
          options:
            - nodev
            - relatime
        scratch:
          mountpoint: /scratch
          size: unlimited
          options:
            - nodev
            - nosuid
            - noatime
  subnets:
    sf-static:
      static: true
      netmask: 255.255.240.0
      gateway: 10.14.0.1
      nameservers: 10.14.0.14 10.14.16.39
      ntpservers: he-ntp0.internal.sifive.com he-ntp1.internal.sifive.com
      domain: internal.sifive.com
    sf-dynamic:
      static: false
      ntpservers: he-ntp0.internal.sifive.com he-ntp1.internal.sifive.com
      domain: internal.sifive.com
    he1-static:
      static: true
      netmask: 255.255.255.0
      gateway: 10.14.16.1
      nameservers: 10.14.16.38 10.14.16.39
      ntpservers: he-ntp0.internal.sifive.com he-ntp1.internal.sifive.com
      domain: internal.sifive.com
    he1-dynamic:
      static: false
      ntpservers: he-ntp0.internal.sifive.com he-ntp1.internal.sifive.com
      domain: internal.sifive.com
  trees:
    ubuntu:
      dir: /srv/www/install/preseed/ubuntu
      url: http://install.internal.sifive.com/preseed/ubuntu
      saltrepo: repo.saltstack.com/apt/ubuntu/16.04/amd64/2016.11
      saltmaster: salt.internal.sifive.com
      salthash: sha256
      disthost: mirrors.kernel.org
      distdir: ubuntu
      distsuite: xenial
      hosts:
        algol:
          ipaddress: 10.14.0.12
          subnet: sf-static
          serial: '0'
          diskname: /dev/vda
          diskmethod: lvm
          disklayout: vm_small_disk
        altair:
          ipaddress: 10.14.16.72
          subnet: he1-static
          serial: '0'
          diskname: /dev/vda
          diskmethod: lvm
          disklayout: vm_small_disk
        betel:
          ipaddress: 10.14.16.73
          subnet: he1-static
          serial: '0'
          diskname: /dev/vda
          diskmethod: lvm
          disklayout: vm_small_disk
        canal:
          ipaddress: 10.14.0.11
          subnet: sf-static
          serial: '0'
          diskname: /dev/vda
          diskmethod: lvm
          disklayout: vm_small_disk
        gamma00:
          subnet: he1-dynamic
          serial: '0'
          diskname: /dev/sda
          diskmethod: lvm
          disklayout: gamma_disk
        gamma01:
          subnet: he1-dynamic
          serial: '0'
          diskname: /dev/sda
          diskmethod: lvm
          disklayout: gamma_disk
        gamma02:
          subnet: he1-dynamic
          serial: '0'
          diskname: /dev/sda
          diskmethod: lvm
          disklayout: gamma_disk
        gamma03:
          subnet: he1-dynamic
          serial: '0'
          diskname: /dev/sda
          diskmethod: lvm
          disklayout: gamma_disk
        gamma04:
          subnet: he1-dynamic
          serial: '0'
          diskname: /dev/sda
          diskmethod: lvm
          disklayout: gamma_disk
        gamma05:
          subnet: he1-dynamic
          serial: '0'
          diskname: /dev/sda
          diskmethod: lvm
          disklayout: gamma_disk
        gamma06:
          subnet: he1-dynamic
          serial: '0'
          diskname: /dev/sda
          diskmethod: lvm
          disklayout: gamma_disk
        gamma07:
          subnet: he1-dynamic
          serial: '0'
          diskname: /dev/sda
          diskmethod: lvm
          disklayout: gamma_disk
        gravelpit:
          subnet: sf-dynamic
          serial: '0'
          diskname: /dev/vda
          diskmethod: lvm
          disklayout: vm_small_disk
        hansolo:
          ipaddress: 10.14.0.14
          subnet: sf-static
          serial: '0'
          diskname: /dev/vda
          diskmethod: lvm
          disklayout: vm_small_disk
        klingon:
          ipaddress: 10.14.16.74
          subnet: he1-static
          serial: '0'
          diskname: /dev/vda
          diskmethod: lvm
          disklayout: vm_small_disk
        leia:
          ipaddress: 10.14.16.38
          subnet: he1-static
          serial: '0'
          diskname: /dev/vda
          diskmethod: lvm
          disklayout: vm_small_disk
        luke:
          ipaddress: 10.14.16.39
          subnet: he1-static
          serial: '0'
          diskname: /dev/vda
          diskmethod: lvm
          disklayout: vm_small_disk
        nuc1:
          subnet: sf-dynamic
          diskname: /dev/sda
          diskmethod: crypto
          disklayout: compute_disk
        sandbox:
          ipaddress: 10.14.16.36
          subnet: he1-static
          serial: '0'
          diskname: /dev/vda
          diskmethod: lvm
          disklayout: vm_small_disk
