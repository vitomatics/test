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
        static-he1:
          ntp-server: ntp1.example.com ntp2.example.com
          domain: internal.sifive.com
      hosts:
        nuc1:
          ipaddress: 10.11.12.13
          subnet: static-he1
          console: tty0
          disk-name: /dev/sda
          disk-method: crypto
          libs:
            - base
            - disk-big
            - subnet-he1
        sandbox:
          subnet: static-he1
          console: tty0
          disk-name: /dev/xvda
          disk-method: lvm
          libs:
            - base
            - disk-big
            - subnet-he1
