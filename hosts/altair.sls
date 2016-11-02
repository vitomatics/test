## pillar file for altair

states:
  nomachine.terminal-server: true

nomachine:
  lookup:
    tsurl: http://sfimages.internal.sifive.com/nomachine/deb/nomachine-terminal-server-evaluation_5.1.54_2_amd64.deb
  terminal-server:
    EnableNetworkBroadcast: false
    PhysicalDesktopSharing: false
    VirstualDesktopSharing: true

# network - dhcp

# boot:
#   grub:
#     serial:
#       port: 1
