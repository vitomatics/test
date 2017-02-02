## SiFive preseed tree - Ubuntu

sfpreseed:
  trees:
    ubuntu:
      dir: /srv/www/install/preseed/ubuntu
      mirror:
        hostname: mirrors.kernel.org
        directory: /ubuntu
        suite: xenial
      subnets:
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
	  static: true
          subnet: he1-static
          console: tty0
          disk-name: /dev/sda
          disk-method: crypto
          libs:
            - base
            - disk-big
            - subnet-he1
        sandbox:
          subnet: he1-dynamic
          console: tty0
          disk-name: /dev/xvda
          disk-method: lvm
          libs:
            - base
            - disk-big
            - subnet-he1
