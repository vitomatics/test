# Pillar config for SiFive DHCPD server

states:
  dhcpd: true
  dhcpd.config: true

dhcpd:
  listen_interfaces:
    - lo

  domain_name: internal.sifive.com
  default_lease_time: 600
  max_lease_time: 7200
  
