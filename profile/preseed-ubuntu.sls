## SiFive preseed tree - Ubuntu

sfpreseed:
  trees:
    ubuntu:
      dir: /srv/www/install/preseed/ubuntu
      mirror:
        hostname:
        directory:
	suite:
      subnets:
        static-he1:
          ntp-server: ntp1.example.com ntp2.example.com
          domain: internal.sifive.com
      hosts:
        server1:
          ipaddress: 10.11.12.13
          subnet: static-he1
          console: tty0
          disk: /dev/xvda
          libs:
            - base
            - disk-big
            - subnet-he1
