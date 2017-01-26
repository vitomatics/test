# SiFive HE secondary DHCP server

include:
  - profile.dhcpserver

dhcpd:
  listen-interfaces:
    - lo
  subnets:
    # he-unix01-net
    10.14.16.0:
      netmask: 255.255.255.0
      routers: 10.14.16.1
      default-lease-time: 12960
      max-lease-time: 12960
      domain-name-servers: 
        - 10.14.16.38
        - 10.14.16.39
{% block he_unix01_extra %}
{% endblock %}
