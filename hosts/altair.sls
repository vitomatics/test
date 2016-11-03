## pillar file for altair

# network - dhcp

## test firewall stuff for altair
firewall:
  sshguard: true
  ports:
    tcp:
      22: 0.0.0.0/0

# boot:
#   grub:
#     serial:
#       port: 1
