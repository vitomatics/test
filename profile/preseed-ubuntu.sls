## SiFive preseed tree - Ubuntu

states:
  sfpreseed: true

sfpreseed:
  disklayouts:
    boardtest_ssd:
      swap:
        size: 17176
      boot:
        size: 1074
        filesystem: ext4
      parts:
        root:
          mountpoint: /
          size: 68704
          options:
            - noatime
        var:
          mountpoint: /var
          size: 34352
          options:
            - nodev
            - relatime
        boardtest-nfs:
          mountpoint: /srv/boardtest/nfs
          size: 42949
          options:
            - nodev
            - relatime
        boardtest-tftp:
          mountpoint: /srv/boardtest/tftpboot
          size: 17176
          options:
            - nodev
            - relatime
        scratch:
          mountpoint: /scratch
          size: 500000
          options:
            - nodev
            - nosuid
            - noatime
    compute_ssd:
      swap:
        size: 17176
      boot:
        size: 1074
        filesystem: ext4
      parts:
        root:
          mountpoint: /
          size: 68704
          options:
            - noatime
        var:
          mountpoint: /var
          size: 34352
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
    compute_ssd_noscratch:
      swap:
        size: 17176
      boot:
        size: 1074
        filesystem: ext4
      parts:
        root:
          mountpoint: /
          size: 68704
          options:
            - noatime
        var:
          mountpoint: /var
          size: unlimited
          options:
            - nodev
            - relatime
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
    server_ssd_disk:
      swap:
        size: 14173
      boot:
        size: 1074
        filesystem: ext4
      parts:
        root:
          mountpoint: /
          size: 68719
          filesystem: ext4
          options:
            - noatime
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
      nameservers: 10.14.16.38 10.14.17.38
      ntpservers: he-rack1-ntp.internal.sifive.com he-rack2-ntp.internal.sifive.com
      domain: internal.sifive.com
    sf-dynamic:
      static: false
      ntpservers: he-rack1-ntp.internal.sifive.com he-rack2-ntp.internal.sifive.com
      domain: internal.sifive.com
    he-unix-dynamic:
      static: false
      ntpservers: he-rack1-ntp.internal.sifive.com he-rack2-ntp.internal.sifive.com
      domain: internal.sifive.com
    he-unix01-static:
      static: true
      netmask: 255.255.255.0
      gateway: 10.14.16.1
      nameservers: 10.14.16.38 10.14.17.38
      ntpservers: he-rack1-ntp.internal.sifive.com he-rack2-ntp.internal.sifive.com
      domain: internal.sifive.com
    he-unix02-static:
      static: true
      netmask: 255.255.255.0
      gateway: 10.14.17.1
      nameservers: 10.14.16.38 10.14.17.38
      ntpservers: he-rack1-ntp.internal.sifive.com he-rack2-ntp.internal.sifive.com
      domain: internal.sifive.com
    he-iso01-static:
      static: true
      netmask: 255.255.255.0
      gateway: 10.134.16.1
      nameservers: 10.14.16.38 10.14.17.38
      ntpservers: he-rack1-ntp.internal.sifive.com he-rack2-ntp.internal.sifive.com
      domain: internal.sifive.com
  trees:
    ubuntu:
      dir: /srv/www/install/preseed/ubuntu
      url: http://install.internal.sifive.com/preseed/ubuntu
      saltrepo: http://sfrepo.internal.sifive.com/ubuntu/saltstack
      saltkey: http://sfimages.internal.sifive.com/Saltstack/keys/SALTSTACK-GPG-KEY.pub
      saltmaster:
        - salt.internal.sifive.com
      salthash: sha256
      saltconffile: 99-sfpreseed.conf
      disthost: sfrepo.internal.sifive.com
      distunauth: true
      distdir: ubuntu/canonical
      distsuite: xenial
      distkey: http://sfimages.internal.sifive.com/Ubuntu/keys/trusted.gpg
      rootpw: $6$Fm.qsqQKN$Pw/2FoXx2hBz9ygQmY8xGWfWvjzMkMmwAVtNv1XwEpmq/VDisVbJVuBpr4E6ClHIR4nELDhJ9lnamaBvTp7sr/
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
          subnet: he-unix01-static
          serial: '0'
          diskname: /dev/vda
          diskmethod: lvm
          disklayout: vm_med_disk
        b0:
          ipaddress: 10.14.1.6
          subnet: sf-static
          serial: '0'
          diskname: /dev/sda
          diskmethod: crypt
          disklayout: compute_ssd_disk
        bender:
          ipaddress: 10.14.0.13
          subnet: sf-static
          serial: '0'
          diskname: /dev/sda
          diskmethod: crypto
          disklayout: server_ssd_disk
        betel:
          ipaddress: 10.14.16.73
          subnet: he-unix01-static
          serial: '0'
          diskname: /dev/vda
          diskmethod: lvm
          disklayout: vm_small_disk
        dalek:
          ipaddress: 10.14.0.11
          subnet: he-unix01-static
          serial: '0'
          diskname: /dev/vda
          diskmethod: lvm
          disklayout: vm_small_disk
        eddie:
          ipaddress: 10.14.16.32
          subnet: he-unix01-static
          serial: '0'
          diskname: /dev/sda
          diskmethod: lvm
          disklayout: server_ssd_disk
        frogstar:
          ipaddress: 10.14.16.77
          subnet: he-unix01-static
          serial: '0'
          diskname: /dev/vda
          diskmethod: lvm
          disklayout: vm_med_disk
        gamma:
          subnet: he-unix-dynamic
          serial: '0'
          diskname: /dev/sda
          diskmethod: lvm
          disklayout: gamma_disk
        consul01:
          subnet: sf-dynamic
          serial: '0'
          diskname: /dev/vda
          diskmethod: lvm
          disklayout: vm_small_disk
        consul02:
          subnet: sf-dynamic
          serial: '0'
          diskname: /dev/vda
          diskmethod: lvm
          disklayout: vm_small_disk
	gravelpit:
          subnet: sf-dynamic
          serial: '0'
          diskname: /dev/vda
          diskmethod: lvm
          disklayout: vm_small_disk
        grid:
          ipaddress: 10.14.16.75
          subnet: he-unix01-static
          serial: '0'
          diskname: /dev/vda
          diskmethod: lvm
          disklayout: vm_med_disk
        hal:
          ipaddress: 10.14.16.40
          subnet: he-unix01-static
          serial: '0'
          diskname: /dev/vda
          diskmethod: lvm
          disklayout: vm_med_disk
        hansolo:
          ipaddress: 10.14.0.14
          subnet: sf-static
          serial: '0'
          diskname: /dev/vda
          diskmethod: lvm
          disklayout: vm_small_disk
        heartofgold:
          ipaddress: 10.14.16.48
          subnet: he-unix01-static
          serial: '0'
          diskname: /dev/sda
          diskmethod: lvm
          disklayout: server_ssd_disk
        klingon:
          ipaddress: 10.14.16.74
          subnet: he-unix01-static
          serial: '0'
          diskname: /dev/vda
          diskmethod: lvm
          disklayout: vm_small_disk
        leia:
          ipaddress: 10.14.16.38
          subnet: he-unix01-static
          serial: '0'
          diskname: /dev/vda
          diskmethod: lvm
          disklayout: vm_small_disk
        luke:
          ipaddress: 10.14.16.39
          subnet: he-unix01-static
          serial: '0'
          diskname: /dev/vda
          diskmethod: lvm
          disklayout: vm_small_disk
        marvin:
          ipaddress: 10.14.16.32
          subnet: he-unix01-static
          serial: '0'
          diskname: /dev/sda
          diskmethod: lvm
          disklayout: server_ssd_disk
        matrix:
          ipaddress: 10.14.16.76
          subnet: he-unix01-static
          serial: '0'
          diskname: /dev/vda
          diskmethod: lvm
          disklayout: vm_med_disk
        delta:
          subnet: sf-dynamic
          kargs: text nomodeset xforcevesa
          diskname: /dev/sda
          diskmethod: lvm
          disklayout: compute_ssd
        epsilon:
          subnet: sf-dynamic
          kargs: text nomodeset xforcevesa
          diskname: /dev/sda
          diskmethod: lvm
          disklayout: boardtest_ssd
        omega1:
          ipaddress: 10.14.1.5
          subnet: sf-static
          serial: '0'
          diskname: /dev/sda
          diskmethod: crypto
          disklayout: server_ssd_disk
        sandbox:
          ipaddress: 10.14.17.39
          subnet: he-unix02-static
          serial: '0'
          diskname: /dev/vda
          diskmethod: lvm
          disklayout: vm_small_disk
        timewarp:
          ipaddress: 10.14.17.40
          subnet: he-unix-dynamic
          serial: '0'
          diskname: /dev/vda
          diskmethod: lvm
          disklayout: vm_med_disk
        tardis:
          ipaddress: 10.14.16.49
          subnet: he-unix01-static
          serial: '0'
          diskname: /dev/vda
          diskmethod: lvm
          disklayout: vm_small_disk
        transporter:
          ipaddress: 10.14.16.34
          subnet: he-unix01-static
          serial: '0'
          diskname: /dev/vda
          diskmethod: lvm
          disklayout: vm_small_disk
        vader:
          ipaddress: 10.14.16.44
          subnet: he-unix01-static
          serial: '0'
          diskname: /dev/vda
          diskmethod: lvm
          disklayout: vm_med_disk
        viki:
          ipaddress: 10.14.16.41
          subnet: he-unix01-static
          serial: '0'
          diskname: /dev/vda
          diskmethod: lvm
          disklayout: vm_med_disk
        vulcan:
          ipaddress: 10.14.16.37
          subnet: he-unix01-static
          serial: '0'
          diskname: /dev/vda
          diskmethod: lvm
          disklayout: vm_med_disk
        yoda:
          ipaddress: 10.14.16.42
          subnet: he-unix01-static
          serial: '0'
          diskname: /dev/vda
          diskmethod: lvm
          disklayout: vm_med_disk
        lambda00:
          ipaddress: 10.134.16.33
          subnet: he-iso01-static
          diskname: /dev/sda
          diskmethod: lvm
          disklayout: gamma_disk
        jarjar:
          ipaddress: 10.14.16.43
          subnet: he-unix01-static
        jabba:
          ipaddress: 10.14.16.45
          subnet: he-unix01-static
        alpha:
          ipaddress: 10.14.1.4
          subnet: sf-static
          serial: '0'
          diskname: /dev/sda
          diskmethod: crypto
          disklayout: compute_ssd_noscratch
        sigma:
          subnet: he-unix-dynamic
          serial: '1'
          diskname: /dev/sda
          diskmethod: lvm
          disklayout: compute_ssd_noscratch
        skynet:
          ipaddress: 10.14.16.47
          subnet: he-unix01-static
          serial: '0'
          diskname: /dev/vda
          diskmethod: lvm
          disklayout: vm_med_disk
        wall-e:
          ipaddress: 10.14.16.46
          subnet: he-unix01-static
          serial: '0'
          diskname: /dev/vda
          diskmethod: lvm
          disklayout: vm_med_disk
        colin:
          ipaddress: 10.14.17.32
          subnet: he-unix02-static
          serial: '0'
          diskname: /dev/sda
          diskmethod: lvm
          disklayout: server_ssd_disk
        chappie:
          ipaddress: 10.14.17.33
          subnet: he-unix02-static
          serial: '0'
          diskname: /dev/sda
          diskmethod: lvm
          disklayout: server_ssd_disk
        zarss:
          ipaddress: 10.14.17.34
          subnet: he-unix02-static
          serial: '0'
          diskname: /dev/vda
          diskmethod: lvm
          disklayout: vm_small_disk
        romulan:
          ipaddress: 10.14.17.35
          subnet: he-unix02-static
          serial: '0'
          diskname: /dev/vda
          diskmethod: lvm
          disklayout: vm_med_disk
        barnards:
          ipaddress: 10.14.17.79
          subnet: he-unix02-static
          serial: '0'
          diskname: /dev/vda
          diskmethod: lvm
          disklayout: vm_med_disk
        maul:
          ipaddress: 10.14.17.36
          subnet: he-unix02-static
          serial: '0'
          diskname: /dev/vda
          diskmethod: lvm
          disklayout: vm_med_disk
        anakin:
          ipaddress: 10.14.17.38
          subnet: he-unix02-static
          serial: '0'
          diskname: /dev/vda
          diskmethod: lvm
          disklayout: vm_med_disk
        magrathea:
          ipaddress: 10.14.17.37
          subnet: he-unix02-static
          serial: '0'
          diskname: /dev/vda
          diskmethod: lvm
          disklayout: vm_med_disk
        gaia:
          ipaddress: 10.14.17.41
          subnet: he-unix02-static
          serial: '0'
          diskname: /dev/vda
          diskmethod: lvm
          disklayout: vm_med_disk
        terminus:
          ipaddress: 10.14.17.80
          subnet: he-unix02-static
          serial: '0'
          diskname: /dev/vda
          diskmethod: lvm
          disklayout: vm_med_disk
