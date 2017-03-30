## pillar file for sandbox


# network - dhcp

states:
  firewall.iptables: true


opensmtpd:
  relay: transporter.internal.sifive.com

