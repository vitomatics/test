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
    breker:
      disttype: tgz
      disturl: http://sfimages.internal.sifive.com/Breker/flexlm/breker-flexlm-20180905.tar.gz
      dir: breker-flexlm-20180905
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
          absent: true
        mentor-20180427:
          absent: true
        mentor-20180501:
          absent: true
        mentor-20180508:
          absent: true
        mentor-20180705:
          absent: true
        mentor-20181008:
          absent: true
        mentor-20181015:
          pillar: site:licenses:mgcld:mentor-20181015
    xilinxd:
      vendor: xilinx
      bindir: linux_flexlm_v11.14.1.0/lnx64.o
      port: 2100
      vport: 2101
      options:
        - RESERVE 1 Vivado_Design_Edition:VERSION=2019.08 USER jenkins
      licenses:
        xilinx-20170519:
          pillar: site:licenses:xilinxd:xilinx-20170519
        xilinx-20180808:
          pillar: site:licenses:xilinxd:xilinx-20180808
    alterad:
      vendor: altera
      bindir: flexlm-18.0.0.219
      libdir: flexlm-18.0.0.219
      port: 27030
      vport: 27031
      licenses:
        altera-20180726:
          pillar: site:licenses:alterad:altera-20180726
    BREKER:
      vendor: breker
      bindir: breker-flexlm-20180905
      port: 27040
      vport: 27041
      licenses:
        treksoc-20180917:
          absent: true
        treksoc-20181029:
          absent: true
        treksoc-20181105:
          pillar: site:licenses:BREKER:treksoc-20181105


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
      27040: 10.14.0.0/16 10.134.0.0/16
      27041: 10.14.0.0/16 10.134.0.0/16
