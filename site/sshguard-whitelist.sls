## pillar site file for the sshguard whitelist

sshguard:
  whitelist:
    - 10.14.0.0/16       {# unix-net #}
    - 10.17.0.0/16       {# laptop-net #}
    - 10.100.0.0/16      {# routers #}
    - 10.101.0.0/16      {# routers #}
    - 12.206.222.0/29    {# San Mateo ATT ISP #}
    - 96.72.175.168/29   {# San Mateo Comcast ISP #}
    - 64.62.193.192/26   {# Datacenter HE ISP #}
