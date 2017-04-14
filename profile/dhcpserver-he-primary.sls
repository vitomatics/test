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
    - 10.14.16.39

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
      ## Note - pool added on primary server

  hosts:
    gamma00:
      hardware: ethernet e4:1d:2d:47:d3:20
      fixed-address: gamma00.internal.sifive.com
    gamma01:
      hardware: ethernet e4:1d:2d:47:de:10
      fixed-address: gamma01.internal.sifive.com
    gamma02:
      hardware: ethernet e4:1d:2d:47:dd:30
      fixed-address: gamma02.internal.sifive.com
    gamma03:
      hardware: ethernet e4:1d:2d:47:de:20
      fixed-address: gamma03.internal.sifive.com
    gamma04:
      hardware: ethernet e4:1d:2d:47:d3:00
      fixed-address: gamma04.internal.sifive.com
    gamma05:
      hardware: ethernet e4:1d:2d:47:dc:c0
      fixed-address: gamma05.internal.sifive.com
    gamma06:
      hardware: ethernet e4:1d:2d:47:dd:50
      fixed-address: gamma06.internal.sifive.com
    gamma07:
      hardware: ethernet e4:1d:2d:47:dd:60
      fixed-address: gamma07.internal.sifive.com
    sandbox:
      hardware: ethernet 52:54:00:ff:00:03
      fixed-address: sandbox.internal.sifive.com

    heartofgold-admin:
      hardware: ethernet f4:8e:38:cd:ec:d4
      fixed-address: heartofgold-admin.internal.sifive.com
    eddie-admin:
      hardware: ethernet f4:8e:38:cd:e4:14
      fixed-address: eddie-admin.internal.sifive.com
    marvin-admin:
      hardware: ethernet f4:8e:38:cd:da:e4
      fixed-address: marvin-admin.internal.sifive.com
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
      hardware: ethernet 0c:c4:7a:9a:80:5a
      fixed-address: gamma10-admin.internal.sifive.com

{% block hosts_extra %}
{% endblock %}
