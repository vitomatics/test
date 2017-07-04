## pillar file for lambda00

# network - dhcp


boot:
  grub:
    serial: ~

sshguard:
  whitelist:
    - 10.14.0.0/16       {# unix-net #}
    - 10.17.0.0/16       {# laptop-net #}
    - 10.100.0.0/16      {# routers #}
    - 10.101.0.0/16      {# routers #}
    - 106.51.67.7/32     {# smartdv #}
    - 202.83.16.30/32    {# smartdv #}
