# Pillar config for SiFive DHCPD server

states:
  dhcpd: true
  dhcpd.config: true

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

  hosts:
    test.internal.sifive.com:
      allow: booting
      deny: bootp
	
