# Pillar config for SiFive DHCPD server

states:
  sfdhcpd: true
  sfdhcpd.config: true

dhcpd:
  listen_interfaces:
    - lo
  log_facility: daemon
  authoritative: true
  one_lease_per_client: true

{#
dhcpd:
  listen_interfaces:
    - lo

  authoritative: true
  log_facility: daemon
  ddns_update_style: none
  one_lease_per_client: 'on'
  
  allow: booting
  deny:
    - bootp
    - duplicates
  

  default_lease_time: 600
  max_lease_time: 7200
  domain_name: internal.sifive.com

  shared_networks:
    test:
      pools:
        - allow:
           - asdf
           - xsxxx
          deny: zxcv
          range:
            - 1.2.3.4
            - 1.2.3.4
  subnets:
    1.2.3.4:
      netmask: 255.255.255.0
      allow:
        - whatever
        - whatever2
      deny:
        - whatever3
        - whatever4

#}
