## pillar file for altair

# network - dhcp

## test firewall stuff for altair
firewall:
  sshguard: true
  ports:
    tcp:
      22: any
      23: 1.2.3.4/5
      24: ::0
      25: 0000:1111:2222:3333:4444:5555:6666:7777/64
      26: all
      60000:61000: any

# boot:
#   grub:
#     serial:
#       port: 1
