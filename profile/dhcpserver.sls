# Pillar config for SiFive DHCPD server

states:
  dhcpd: true
  dhcpd.config: true

dhcpd:
  listen-interfaces:
    - lo
  include-pillars:
    - site.dhcpd.options-ipxe
    - site.dhcpd.options-pxelinux
  include-text: |
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
  log-facility: daemon
  allow: booting
  deny:
    - bootp
    - duplicates
  one-lease-per-client: true
  {# authoritative: true #}

  domain-name: internal.sifive.com
  domain-name-servers:
    - 10.14.0.14
    - 10.14.16.39
  domain-search:
    - internal.sifive.com
    - sifive.com
  
  hosts:
    nuc1:
      hardware: ethernet f4:4d:30:61:c2:49
      fixed-address: nuc1.internal.sifive.com
    printer01:
      hardware: ethernet b0:5a:da:c7:d0:99
      fixed-address: printer01.internal.sifive.com
    promptuary:
      hardware: ethernet d0:50:99:01:3a:55
      fixed-address: promptuary.internal.sifive.com
