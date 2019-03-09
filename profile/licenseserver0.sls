## pillar file for the secondary license server - jarjar

include:
  - profile.licenseserver


flexnet:
  servername: jarjar.internal.sifive.com
  serverid: '525400ff0015'
  vendors:
    mentor:
      disttype: tgz
      disturl: http://sfimages.internal.sifive.com/Mentor/mgls/mgls-v11.16.0.tar.gz
      dir: mgls-v11.16.0
    xilinx:
      disttype: zip
      disturl: http://sfimages.internal.sifive.com/Xilinx/flexlm/linux_flexlm_v11.14.1.0.zip
      dir: linux_flexlm_v11.14.1.0
    altera:
      disttype: tgz
      disturl: http://sfimages.internal.sifive.com/Intel/Altera/flexlm/flexlm-18.0.0.219.tar.gz
      dir: flexlm-18.0.0.219
    ansys:
      disttype: tgz
      disturl: http://sfimages.internal.sifive.com/Ansys/apacheda/ansys.tar.gz
      dir: apacheda
    breker:
      disttype: tgz
      disturl: http://sfimages.internal.sifive.com/Breker/flexlm/breker-flexlm-20180905.tar.gz
      dir: breker-flexlm-20180905
    synopsys:
      disttype: tgz
      disturl: http://sfimages.internal.sifive.com/Synopsys/scl/scl-2018.06.tar.gz
      dir: scl/2018.06
  daemons:
    mgcld:
      vendor: mentor
      bindir: mgls-v11.16.0/bin
      port: 1717
      vport: 1718
      licenses:
        mentor-20190107:
          absent: true
        mentor-20190201:
          absent: true
        mentor-20190114:
          absent: true
        mentor-20190222:
          absent: true
        mentor-20190307:
          absent: true
        mentor-20190212:
          pillar: site:licenses:mgcld:mentor-20190212
        mentor-20190309:
          pillar: site:licenses:mgcld:mentor-20190309
        mentor-temp-20190309:
          pillar: site:licenses:mgcld:mentor-temp-20190309
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
          absent: true
        treksoc-20181107:
          absent: true
        treksoc-20181120:
          absent: true
        treksoc-20181203:
          absent: true
        treksoc-20190124:
          pillar: site:licenses:BREKER:treksoc-20190124
    # Second Synopsys server - note the main one is on licenseserver0
    snpslmd:
      vendor: synopsys
      bindir: scl/2018.06/linux64/bin
      port: 27000
      vport: 27001
      env: SCL_POOL_VS=1
      licenses:
        synospsys-temp-20181112:
          absent: true
        synospsys-temp-20181113:
          absent: true
        synospsys-temp-20181114:
          absent: true
        synospsys-temp-20190214:
          pillar: site:licenses:snpslmd:synopsys-temp-20190214
        synospsys-temp-20190222:
          pillar: site:licenses:snpslmd:synopsys-temp-20190222

## Firewall holes for flexnet server
firewall:
  ports:
    tcp:
      1717: 10.14.0.0/16 10.134.0.0/16
      1718: 10.14.0.0/16 10.134.0.0/16
      1881: 10.14.0.0/16 10.134.0.0/16  
      2100: 10.14.0.0/16 10.134.0.0/16
      2101: 10.14.0.0/16 10.134.0.0/16
      6000: 10.14.0.0/16 10.134.0.0/16
      27000: 10.14.0.0/16 10.134.0.0/16
      27001: 10.14.0.0/16 10.134.0.0/16
      27030: 10.14.0.0/16 10.134.0.0/16
      27031: 10.14.0.0/16 10.134.0.0/16
      27040: 10.14.0.0/16 10.134.0.0/16
      27041: 10.14.0.0/16 10.134.0.0/16
