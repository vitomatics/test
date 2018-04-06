## pillar file for the secondary license server

include:
  - profile.licenseserver


flexnet:
  servername: jarjar.internal.sifive.com
  serverid: '525400ff0015'
  vendors:
    mentor:
      disttype: tgz
      disturl: http://sfimages.internal.sifive.com/Mentor/mgls/mgls-v11.13.1.2.tar.gz
      dir: mgls-v11.13.1.2
    xilinx:
      disttype: zip
      disturl: http://sfimages.internal.sifive.com/Xilinx/flexlm/linux_flexlm_v11.14.1.0.zip
      dir: linux_flexlm_v11.14.1.0
  daemons:
    mgcld:
      vendor: mentor
      bindir: mgls-v11.13.1.2/bin
      port: 1717
      vport: 1718
      licenses:
        mentor-20170725:
          absent: true
        mentor-20170817:
          absent: true
        mentor-20170823:
          absent: true
        mentor-20170928:
          absent: true
        mentor-20180105:
          absent: true
        mentor-20180110:
          pillar: site:licenses:mgcld:mentor-20180110
        mentor-20180406:
          pillar: site:licenses:mgcld:mentor-20180406
    xilinxd:
      vendor: xilinx
      bindir: linux_flexlm_v11.14.1.0/lnx64.o
      port: 2100
      vport: 2101
      licenses:
        xilinx-20170519:
          pillar: site:licenses:xilinxd:xilinx-20170519


## Firewall holes for flexnet server
firewall:
  ports:
    tcp:
      1717: 10.14.0.0/16 10.134.0.0/16
      1718: 10.14.0.0/16 10.134.0.0/16
      2100: 10.14.0.0/16 10.134.0.0/16
      2101: 10.14.0.0/16 10.134.0.0/16
