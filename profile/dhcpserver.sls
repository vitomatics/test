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
  local_address: 1.2.3.4
  domain_name_servers:
    - 10.14.16.38
    - 10.14.16.38
  domain_search:
    - internal.sifive.com
    - sifive.com
  allow:
    - booting
    - bootp

  domain_name: internal.sifive.com
  subnets:
    1.2.3.4:
      deny: bootp
      netmask: 255.255.255.0
      domain_name: test.sifive.com
      routers: 1.2.3.4
      domain_search: sifive.com
      next_server: pxe.internal.sifive.com
      hosts:
        gamma00:
          fixed_address: gamma00.internal.sifive.com
          hardware: ethernet 00:11:22:33:44:55
  hosts:
    gamma01:
      fixed_address: gamma01.internal.sifive.com
      hardware: ethernet 00:11:22:33:44:66

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
