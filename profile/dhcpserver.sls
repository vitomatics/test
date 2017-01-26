# Pillar config for SiFive DHCPD server

states:
  sfdhcpd: true
  sfdhcpd.config: true

dhcpd:
  listen_interfaces:
    - lo
  include_pillars:
    - site.dhcpd.options_ipxe
    - site.dhcpd.options_pxelinux
  include_text: |
    class "pxeclient" {
      match if substring (option vendor-class-identifier, 0, 9) = "PXEClient";
      set vendor-string = option vendor-class-identifier;
      # RFC 4578, Client System Architecture Type Option Definition
      # 0: IA x86 PC (BIOS)
      # 6: EFI IA32 (sometimes misused for CSM boot)
      # 7: EFI bytecode (sometimes misused for EFI x86-64 boot)
      # 9: EFI x86-64
      if option architecture-type = 00:00 {
        filename "pxe/undionly.kpxe";
      } elsif option architecture-type = 00:06 {
        filename "pxe/snponly-x86.efi";
      } elsif option architecture-type = 00:07 {
        filename "pxe/snponly-x64.efi";
      } elsif option architecture-type = 00:09 {
        filename "pxe/snponly-x64.efi";
      }
      option ipxe.no-pxedhcp 1;
    }
    class "debinstall" {
      match if substring (option vendor-class-identifier, 0, 3) = "d-i";
    }
  log_facility: daemon
  allow: booting
  deny:
    - bootp
    - duplicates
  one_lease_per_client: true
  authoritative: true

  domain_name: internal.sifive.com
  domain_name_servers:
    - 10.14.0.14
    - 10.14.16.39
  domain_search:
    - internal.sifive.com
    - sifive.com
  
  subnets:
    # sf-unix
    10.14.0.0:
      netmask: 255.255.240.0
      routers: 10.14.0.1
      domain_name_servers: 
        - 10.14.0.14
        - 10.14.16.39
      ntp_servers:
        - 10.14.0.14
	- 10.14.16.39
      pools:
        regular_pool:
	  range:
	    - 10.14.3.10
	    - 10.14.3.224
	  deny:
	    - members of "pxeclient"
	    - members of "debinstall"
	install_pool:
	  default_lease_time: 180
	  max_lease_time: 360
	  next_server: tftpboot.internal.sifive.com
	  range:
	    - 10.14.3.10
	    - 10.14.3.224
	  allow:
	    - members of "pxeclient"
	    - members of "debinstall"	  
  hosts:
    nuc1:
      hardware: ethernet f4:4d:30:61:c2:49
      fixed_address: nuc1.internal.sifive.com
    printer01:
      hardware: ethernet b0:5a:da:c7:d0:99
      fixed_address: printer01.internal.sifive.com
    promptuary:
      hardware: ethernet d0:50:99:01:3a:55
      fixed_address: promptuary.internal.sifive.com

