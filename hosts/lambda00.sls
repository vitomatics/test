## pillar file for lambda00

# network - dhcp


boot:
  grub:
    serial:
      port: 1

sshguard:
  whitelist:
    - 10.14.0.0/16       {# unix-net #}
    - 10.17.0.0/16       {# laptop-net #}
    - 10.100.0.0/16      {# routers #}
    - 10.101.0.0/16      {# routers #}
    - 106.51.67.7/32     {# smartdv #}
    - 202.83.16.30/32    {# smartdv #}

firewall:
  ports:
    tcp:
      22: 10.14.0.0/16 10.17.0.0/16
    udp:
      60000:61000: 10.14.0.0/16 10.17.0.0/16
