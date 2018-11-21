## pillar file for unlicensed, but production package, nomachine setup

states:
  nomachine.terminalserver: true
  # nomachine.terminalserver.license: true

nomachine:
  lookup:
    # Note we have to use the URL for the new install otherwise
    # it tries to install the update version
  terminal-server:
    EnableNetworkBroadcast: true
    PhysicalDesktopSharing: false
    VirtualDesktopSharing: true

pam:
  access:
    nx: 127.0.0.1
