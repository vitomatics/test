## pillar file for the secondary license server

states:
  firewall.iptables: true
  flexnet.analyze: true

flexnet:
  lookup:
    logdir: /srv/flexlm/log
    licensedir: /srv/flexlm/licenses
    downloaddir: /srv/flexlm/downloads
    vendordir: /srv/flexlm/vendor
    user: flexlm
    group: nogroup
  servername: test.internal.sifive.com
  serverid: '012345012345'
  daemons:
    mgcld:
      vendor: mentor
      licenses:
        mentor-20170725:
          pillar: site:licenses:mgcld:mentor-20170725
        mentor-20170817:
          pillar: site:licenses:mgcld:mentor-20170817
        mentor-20170823:
          pillar: site:licenses:mgcld:mentor-20170823
    xilinxd:
      vendor: xilinx
      licenses:
        xilinx-20170519:
          pillar: site:licenses:xilinxd:xilinx-20170519
    snpslmd:
    smartdv:
    cdslmd:
    mgcld:
    interrad:


