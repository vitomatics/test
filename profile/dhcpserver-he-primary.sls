# SiFive HE primary DHCP server

include:
  - profile.dhcpserver

dhcpd:
  listen-interfaces:
    - lo
  default-lease-time: 12960
  max-lease-time: 12960
  domain-name-servers:
    - 10.14.16.38
    - 10.14.17.38

  subnets:
    # he-unix01-net
    10.14.16.0:
      netmask: 255.255.255.0
      routers: 10.14.16.1
      ## Note - pool added on primary server
{% block he_unix01_dynamic %}
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
{% endblock %}

    # he-unix02-net
    10.14.17.0:
      netmask: 255.255.255.0
      routers: 10.14.17.1
{% block he_unix02_dynamic %}
      pools:
        install_pool:
          default-lease-time: 600
          max-lease-time: 600
          next-server: tftpboot.internal.sifive.com
          range:
            - 10.14.17.224
            - 10.14.17.254
          allow:
            - members of "pxeclient"
            - members of "debinstall"
{% endblock %}

    # he-dev01-net
    10.15.16.0:
      netmask: 255.255.255.0
      routers: 10.15.16.1

    # he-dev02-net
    10.15.17.0:
      netmask: 255.255.255.0
      routers: 10.15.17.1

    # he-iso01-net
    10.134.16.0:
      netmask: 255.255.255.0
      routers: 10.134.16.1
{% block he_iso01_dynamic %}
      pools:
        install_pool:
          default-lease-time: 600
          max-lease-time: 600
          next-server: tftpboot.internal.sifive.com
          range:
            - 10.134.16.224
            - 10.134.16.254
          allow:
            - members of "pxeclient"
            - members of "debinstall"
{% endblock %}
      
  hosts:
    gamma00:
      hardware: ethernet e4:1d:2d:47:d3:20
      fixed-address: gamma00.internal.sifive.com
      host-name: gamma00.internal.sifive.com
      next-server: tftpboot.internal.sifive.com
    gamma01:
      hardware: ethernet e4:1d:2d:47:de:10
      fixed-address: gamma01.internal.sifive.com
      host-name: gamma01.internal.sifive.com
      next-server: tftpboot.internal.sifive.com
    gamma02:
      hardware: ethernet e4:1d:2d:47:dd:30
      fixed-address: gamma02.internal.sifive.com
      host-name: gamma02.internal.sifive.com
      next-server: tftpboot.internal.sifive.com
    gamma03:
      hardware: ethernet e4:1d:2d:47:de:20
      fixed-address: gamma03.internal.sifive.com
      host-name: gamma03.internal.sifive.com
      next-server: tftpboot.internal.sifive.com
    gamma04:
      hardware: ethernet e4:1d:2d:47:d3:00
      fixed-address: gamma04.internal.sifive.com
      host-name: gamma04.internal.sifive.com
      next-server: tftpboot.internal.sifive.com
    gamma05:
      hardware: ethernet e4:1d:2d:47:dc:c0
      fixed-address: gamma05.internal.sifive.com
      host-name: gamma05.internal.sifive.com
      next-server: tftpboot.internal.sifive.com
    gamma06:
      hardware: ethernet e4:1d:2d:47:dd:50
      fixed-address: gamma06.internal.sifive.com
      host-name: gamma06.internal.sifive.com
      next-server: tftpboot.internal.sifive.com
    gamma07:
      hardware: ethernet e4:1d:2d:47:dd:60
      fixed-address: gamma07.internal.sifive.com
      host-name: gamma07.internal.sifive.com
      next-server: tftpboot.internal.sifive.com
    gamma10:
      hardware: ethernet 24:8a:07:f8:b3:60
      fixed-address: gamma10.internal.sifive.com
      host-name: gamma10.internal.sifive.com
      next-server: tftpboot.internal.sifive.com
    gamma11:
      hardware: ethernet 24:8a:07:f8:b3:50
      fixed-address: gamma11.internal.sifive.com
      host-name: gamma11.internal.sifive.com
      next-server: tftpboot.internal.sifive.com
    gamma12:
      hardware: ethernet 24:8a:07:f8:b2:80
      fixed-address: gamma12.internal.sifive.com
      host-name: gamma12.internal.sifive.com
      next-server: tftpboot.internal.sifive.com
    gamma13:
      hardware: ethernet 24:8a:07:f8:aa:a0
      fixed-address: gamma13.internal.sifive.com
      host-name: gamma13.internal.sifive.com
      next-server: tftpboot.internal.sifive.com
    gamma14:
      hardware: ethernet 24:8a:07:f8:aa:80
      fixed-address: gamma14.internal.sifive.com
      host-name: gamma14.internal.sifive.com
      next-server: tftpboot.internal.sifive.com
{#
    gamma15:
      hardware: ethernet 24:8a:07:f8:b2:60
      fixed-address: gamma15.internal.sifive.com
      next-server: tftpboot.internal.sifive.com
#}

    lambda00:
      hardware: ethernet 0c:c4:7a:9a:85:d2
      fixed-address: lambda00.internal.sifive.com
      host-name: lambda00.internal.sifive.com
      next-server: tftpboot.internal.sifive.com

    sigma00:
      hardware: ethernet ec:0d:9a:b9:a9:b0
      fixed-address: sigma00.internal.sifive.com
      host-name: sigma00.internal.sifive.com
      next-server: tftpboot.internal.sifive.com
      filename: "pxe/fbmenu.ipxe"
    sigma01:
      hardware: ethernet ec:0d:9a:b9:a3:50
      fixed-address: sigma01.internal.sifive.com
      host-name: sigma01.internal.sifive.com
      next-server: tftpboot.internal.sifive.com
      filename: "pxe/fbmenu.ipxe"
    sigma02:
      hardware: ethernet ec:0d:9a:b9:a4:20
      fixed-address: sigma02.internal.sifive.com
      host-name: sigma02.internal.sifive.com
      next-server: tftpboot.internal.sifive.com
      filename: "pxe/fbmenu.ipxe"
    sigma03:
      hardware: ethernet ec:0d:9a:b9:a2:d0
      fixed-address: sigma03.internal.sifive.com
      host-name: sigma03.internal.sifive.com
      next-server: tftpboot.internal.sifive.com
      filename: "pxe/fbmenu.ipxe"
    sigma04:
      hardware: ethernet ec:0d:9a:b9:a3:30
      fixed-address: sigma04.internal.sifive.com
      host-name: sigma04.internal.sifive.com
      next-server: tftpboot.internal.sifive.com
      filename: "pxe/fbmenu.ipxe"
    sigma05:
      hardware: ethernet ec:0d:9a:b9:a4:00
      fixed-address: sigma05.internal.sifive.com
      host-name: sigma05.internal.sifive.com
      next-server: tftpboot.internal.sifive.com
      filename: "pxe/fbmenu.ipxe"
    sigma06:
      hardware: ethernet ec:0d:9a:b9:a3:60
      fixed-address: sigma06.internal.sifive.com
      host-name: sigma06.internal.sifive.com
      next-server: tftpboot.internal.sifive.com
      filename: "pxe/fbmenu.ipxe"
    sigma07:
      hardware: ethernet ec:0d:9a:b9:a4:40
      fixed-address: sigma07.internal.sifive.com
      host-name: sigma07.internal.sifive.com
      next-server: tftpboot.internal.sifive.com
      filename: "pxe/fbmenu.ipxe"
    sigma08:
      hardware: ethernet ec:0d:9a:b9:a2:f0
      fixed-address: sigma08.internal.sifive.com
      host-name: sigma08.internal.sifive.com
      next-server: tftpboot.internal.sifive.com
      filename: "pxe/fbmenu.ipxe"
    sigma09:
      hardware: ethernet ec:0d:9a:b9:a7:a0
      fixed-address: sigma09.internal.sifive.com
      host-name: sigma09.internal.sifive.com
      next-server: tftpboot.internal.sifive.com
      filename: "pxe/fbmenu.ipxe"
    sigma10:
      hardware: ethernet ec:0d:9a:f0:c8:90
      fixed-address: sigma10.internal.sifive.com
      host-name: sigma10.internal.sifive.com
      next-server: tftpboot.internal.sifive.com
      filename: "pxe/fbmenu.ipxe"
    sigma11:
      hardware: ethernet ec:0d:9a:ef:11:30
      fixed-address: sigma11.internal.sifive.com
      host-name: sigma11.internal.sifive.com
      next-server: tftpboot.internal.sifive.com
      filename: "pxe/fbmenu.ipxe"
    sigma12:
      hardware: ethernet ec:0d:9a:ed:a7:60
      fixed-address: sigma12.internal.sifive.com
      host-name: sigma12.internal.sifive.com
      next-server: tftpboot.internal.sifive.com
      filename: "pxe/fbmenu.ipxe"
    sigma13:
      hardware: ethernet ec:0d:9a:ed:a2:40
      fixed-address: sigma13.internal.sifive.com
      host-name: sigma13.internal.sifive.com
      next-server: tftpboot.internal.sifive.com
      filename: "pxe/fbmenu.ipxe"
    sigma14:
      hardware: ethernet ec:0d:9a:f0:c8:70
      fixed-address: sigma14.internal.sifive.com
      host-name: sigma14.internal.sifive.com
      next-server: tftpboot.internal.sifive.com
      filename: "pxe/fbmenu.ipxe"

    sandbox:
      hardware: ethernet 52:54:00:ff:00:03
      fixed-address: sandbox.internal.sifive.com
      host-name: sadnbox.internal.sifive.com

    heartofgold-admin:
      hardware: ethernet f4:8e:38:cd:ec:d4
      fixed-address: heartofgold-admin.internal.sifive.com
    eddie-admin:
      hardware: ethernet f4:8e:38:cd:e4:14
      fixed-address: eddie-admin.internal.sifive.com
    marvin-admin:
      hardware: ethernet f4:8e:38:cd:da:e4
      fixed-address: marvin-admin.internal.sifive.com
    colin-admin:
      hardware: ethernet 54:48:10:ef:32:9c
      fixed-address: colin-admin.internal.sifive.com
    chappie-admin:
      hardware: ethernet 54:48:10:f4:6d:86
      fixed-address: chappie-admin.internal.sifive.com

    gamma00-admin:
      hardware: ethernet 0c:c4:7a:c4:5d:af
      fixed-address: gamma00-admin.internal.sifive.com
    gamma01-admin:
      hardware: ethernet 0c:c4:7a:c4:6f:60
      fixed-address: gamma01-admin.internal.sifive.com
    gamma02-admin:
      hardware: ethernet 0c:c4:7a:c4:5d:ac
      fixed-address: gamma02-admin.internal.sifive.com
    gamma03-admin:
      hardware: ethernet 0c:c4:7a:c4:6f:56
      fixed-address: gamma03-admin.internal.sifive.com
    gamma04-admin:
      hardware: ethernet 0c:c4:7a:c4:5e:15
      fixed-address: gamma04-admin.internal.sifive.com
    gamma05-admin:
      hardware: ethernet 0c:c4:7a:c4:5e:46
      fixed-address: gamma05-admin.internal.sifive.com
    gamma06-admin:
      hardware: ethernet 0c:c4:7a:c4:5d:f6
      fixed-address: gamma06-admin.internal.sifive.com
    gamma07-admin:
      hardware: ethernet 0c:c4:7a:cf:f0:09
      fixed-address: gamma07-admin.internal.sifive.com
    gamma10-admin:
      hardware: ethernet 0c:c4:7a:9a:7f:8a
      fixed-address: gamma10-admin.internal.sifive.com
    gamma11-admin:
      hardware: ethernet 0c:c4:7a:9a:7f:8b
      fixed-address: gamma11-admin.internal.sifive.com
    gamma12-admin:
      hardware: ethernet 0c:c4:7a:9a:81:6a
      fixed-address: gamma12-admin.internal.sifive.com
    gamma13-admin:
      hardware: ethernet 0c:c4:7a:9a:81:23
      fixed-address: gamma13-admin.internal.sifive.com
    gamma14-admin:
      hardware: ethernet 0c:c4:7a:9a:7f:88
      fixed-address: gamma14-admin.internal.sifive.com

    lambda00-admin:
      hardware: ethernet 0c:c4:7a:9a:80:5a
      fixed-address: lambda00-admin.internal.sifive.com

    sigma00-admin:
      hardware: ethernet ac:1f:6b:0c:b3:16
      fixed-address: sigma00-admin.internal.sifive.com
    sigma01-admin:
      hardware: ethernet ac:1f:6b:0c:b5:47
      fixed-address: sigma01-admin.internal.sifive.com
    sigma02-admin:
      hardware: ethernet ac:1f:6b:0c:b3:1f
      fixed-address: sigma02-admin.internal.sifive.com
    sigma03-admin:
      hardware: ethernet 0c:c4:7a:f4:8d:4c
      fixed-address: sigma03-admin.internal.sifive.com
    sigma04-admin:
      hardware: ethernet 0c:c4:7a:f5:49:26
      fixed-address: sigma04-admin.internal.sifive.com
    sigma05-admin:
      hardware: ethernet ac:1f:6b:0c:b5:3b
      fixed-address: sigma05-admin.internal.sifive.com
    sigma06-admin:
      hardware: ethernet ac:1f:6b:0c:b5:32
      fixed-address: sigma06-admin.internal.sifive.com
    sigma07-admin:
      hardware: ethernet ac:1f:6b:0c:b3:14
      fixed-address: sigma07-admin.internal.sifive.com
    sigma08-admin:
      hardware: ethernet 0c:c4:7a:f5:4c:0f
      fixed-address: sigma08-admin.internal.sifive.com
    sigma09-admin:
      hardware: ethernet 0c:c4:7a:f5:49:5f
      fixed-address: sigma09-admin.internal.sifive.com
    sigma10-admin:
      hardware: ethernet ac:1f:6b:0c:f0:c1
      fixed-address: sigma10-admin.internal.sifive.com
    sigma11-admin:
      hardware: ethernet ac:1f:6b:0c:f0:c3
      fixed-address: sigma11-admin.internal.sifive.com
    sigma12-admin:
      hardware: ethernet ac:1f:6b:0d:36:f6
      fixed-address: sigma12-admin.internal.sifive.com
    sigma13-admin:
      hardware: ethernet ac:1f:6b:0d:36:b6
      fixed-address: sigma13-admin.internal.sifive.com
    sigma14-admin:
      hardware: ethernet ac:1f:6b:0d:8d:c5
      fixed-address: sigma14-admin.internal.sifive.com


{% block hosts_extra %}
{% endblock %}
