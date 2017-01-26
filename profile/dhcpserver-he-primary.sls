# SiFive HE primary DHCP server

{% extends "profile/dhcpserver-he-secondary.sls" %}

{% block he_unix01_extra %}
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
