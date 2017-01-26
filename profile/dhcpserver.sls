# Pillar config for SiFive DHCPD server

states:
  dhcpd: true
  dhcpd.config: true

dhcpd:
  listen_interfaces:
    - lo

  log_facility: daemon
  ddns_update_style: none
  allow: booting
  deny: bootp, duplicates
  

  default_lease_time: 600
  max_lease_time: 7200
  domain_name: internal.sifive.com
