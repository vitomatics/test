## pillar file for evaluation nomachine setup

states:
  nomachine.terminalserver: true

nomachine:
  lookup:
    # Note we have to use the URL for the eval install otherwise
    # it tries to install the licensed version
    tsurl: http://sfimages.internal.sifive.com/NoMachine/Terminal_Server/deb/nomachine-terminal-server-evaluation_5.3.9_7_amd64.deb
  terminal-server:
    eval: true
    EnableNetworkBroadcast: true
    PhysicalDesktopSharing: false
    VirtualDesktopSharing: true

pam:
  access:
    nx: 127.0.0.1

