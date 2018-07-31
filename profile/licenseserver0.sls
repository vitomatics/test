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
    altera:
      disttype: tgz
      disturl: http://sfimages.internal.sifive.com/Intel/Altera/flexlm/flexlm-18.0.0.219.tar.gz
      dir: flexlm-18.0.0.219
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
          absent: true
        mentor-20180406:
          absent: true
        mentor-20180418:
          pillar: site:licenses:mgcld:mentor-20180418
        mentor-20180427:
          pillar: site:licenses:mgcld:mentor-20180427
        mentor-20180501:
          pillar: site:licenses:mgcld:mentor-20180501
        mentor-20180508:
          pillar: site:licenses:mgcld:mentor-20180508
        mentor-20180705:
          pillar: site:licenses:mgcld:mentor-20180705
    xilinxd:
      vendor: xilinx
      bindir: linux_flexlm_v11.14.1.0/lnx64.o
      port: 2100
      vport: 2101
      licenses:
        xilinx-20170519:
          pillar: site:licenses:xilinxd:xilinx-20170519
    alterad:
      vendor: altera
      bindir: flexlm-18.0.0.219
      libdir: flexlm-18.0.0.219
      port: 27030
      vport: 27031
      licenses:
        altera-20180726:
          pillar: site:licenses:alterad:altera-20180726


## Firewall holes for flexnet server
firewall:
  ports:
    tcp:
      1717: 10.14.0.0/16 10.134.0.0/16
      1718: 10.14.0.0/16 10.134.0.0/16
      2100: 10.14.0.0/16 10.134.0.0/16
      2101: 10.14.0.0/16 10.134.0.0/16
      27030: 10.14.0.0/16 10.134.0.0/16
      27031: 10.14.0.0/16 10.134.0.0/16
