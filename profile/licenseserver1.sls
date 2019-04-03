## pillar file for main sifive license server - jabba

include:
  - profile.licenseserver


flexnet:
  servername: jabba.internal.sifive.com
  serverid: '0002c94e201e'
  vendors:
    cadence:
      disttype: tgz
      disturl: http://sfimages.internal.sifive.com/Cadence/flexlm/cadence-flexlm-v11.13.1.3-sifive.tar.gz
      dir: cadence-flexlm-v11.13.1.3-sifive
    mentor:
      disttype: tgz
      disturl: http://sfimages.internal.sifive.com/Mentor/mgls/mgls-v11.16.0.tar.gz
      dir: mgls-v11.16.0
    smartdv:
      disttype: tgz
      disturl: http://sfimages.internal.sifive.com/SmartDV/flexlm/smartdv-flexlm-20170216.tar.gz
      dir: smartdv-flexlm-20170216
    synopsys:
      disttype: tgz
      disturl: http://sfimages.internal.sifive.com/Synopsys/scl/scl-2018.06.tar.gz
      dir: scl/2018.06
    tsmc:
      disttype: tgz
      disturl: http://sfimages.internal.sifive.com/TSMC/flexlm/MC2_2012.02.00.d-flexlm.tar.gz
      dir: MC2_2012.02.00.d
    microsemi:
      disttype: tgz
      disturl: http://sfimages.internal.sifive.com/Microsemi/license_servers/Linux_Licensing_Daemon-20180402.tar.gz
      dir: Linux_Licensing_Daemon
  daemons:
    cdslmd:
      vendor: cadence
      bindir: cadence-flexlm-v11.13.1.3-sifive/bin
      port: 5280
      vport: 5281
      licenses:
        cadence-20180211:
          absent: true
        cadence-20180220:
          absent: true
        cadence-20180305:
          absent: true
        cadence-20180307:
          absent: true
        cadence-20180614:
          absent: true
        cadence-20180724:
          absent: true
        cadence-20180914:
          absent: true
        cadence-20180927:
          absent: true
        cadence-20181001:
          absent: true
        cadence-20190108:
          pillar: site:licenses:cdslmd:cadence-20190108
    interrad:
      vendor: tsmc
      bindir: MC2_2012.02.00.d/aux/flexlm/amd64_re3
      port: 27010
      vport: 27011
      licenses:
        tsmc-sram-3864:
          absent: true
        tsmc-sram-4077:
          absent: true
        tsmc-sram-5056:
          absent: true
        tsmc-sram-20180528:
          pillar: site:licenses:interrad:tsmc-sram-20180528
        tsmc-sram-20180814a:
          pillar: site:licenses:interrad:tsmc-sram-20180814a
        tsmc-sram-20180814b:
          pillar: site:licenses:interrad:tsmc-sram-20180814b
        tsmc-07nm-20210326:
          pillar: site:licenses:interrad:tsmc-07nm-20210326
        tsmc-16nm-20210326:
          pillar: site:licenses:interrad:tsmc-16nm-20210326
    mgcld:
      vendor: mentor
      bindir: mgls-v11.13.1.2/bin
      port: 1717
      vport: 1718
      licenses:
        microsemi-01:
          absent: true
        microsemi-02:
          absent: true
        microsemi-20180401:
          absent: true
        microsemi-20190402:
          absent: true          
    smartdv:
      vendor: smartdv
      bindir: smartdv-flexlm-20170216/lnx_64
      port: 5053
      vport: 5054
      licenses:
        smartdv-2017070601:
          absent: true
        smartdv-20170809:
          pillar: site:licenses:smartdv:smartdv-20170809
    snpslmd:
      vendor: synopsys
      bindir: scl/2018.06/linux64/bin
      port: 27000
      vport: 27001
      env: SCL_POOL_VS=1
      licenses:
        microsemi-01:
          absent: true
        microsemi-02:
          absent: true
        synopsys-20171005:
          absent: true
        synopsys-20180327:
          absent: true
        synopsys-20180328:
          absent: true
        synopsys-20180412:
          absent: true
        synopsys-20180430:
          absent: true
        synopsys-20180515:
          absent: true
        synopsys-20180518:
          absent: true
        synopsys-20180601:
          absent: true
        synopsys-20180604:
          absent: true
        synopsys-20180618:
          absent: true
        synopsys-20180619:
          absent: true
        synopsys-20180622:
          absent: true
        synopsys-20180629:
          absent: true
        synopsys-20180705:
          absent: true
        synopsys-20180720:
          absent: true
        synopsys-20180802:
          absent: true
        synopsys-20180816:
          absent: true
        synopsys-20180410:
          absent: true
        synopsys-20180824:
          absent: true
        synopsys-20180829:
          absent: true
        synopsys-20180831:
          absent: true
        synopsys-20180905:
          absent: true
        synopsys-20180910:
          absent: true
        synopsys-20180917:
          absent: true
        synopsys-20181015:
          absent: true
        synopsys-20181018:
          absent: true
        synopsys-20181127:
          absent: true
        synopsys-20181204:
          absent: true
        synopsys-20190108:
          absent: true
        synopsys-20190205:
          absent: true
        synopsys-20190306:
          absent: true
        synopsys-20190318:
          pillar: site:licenses:snpslmd:synopsys-20190318
    actlmgrd:
      vendor: microsemi
      bindir: Linux_Licensing_Daemon
      port: 1702
      vport: 1703
      licenses:
        microsemi-20180401:
          absent: true
        microsemi-20190401:
          pillar: site:licenses:actlmgrd:microsemi-20190401


## Firewall holes for flexnet server
firewall:
  ports:
    tcp:
      1702: 10.14.0.0/16 10.134.0.0/16
      1703: 10.14.0.0/16 10.134.0.0/16
      1717: 10.14.0.0/16 10.134.0.0/16
      1718: 10.14.0.0/16 10.134.0.0/16
      5053: 10.14.0.0/16 10.134.0.0/16
      5054: 10.14.0.0/16 10.134.0.0/16
      5280: 10.14.0.0/16 10.134.0.0/16
      5281: 10.14.0.0/16 10.134.0.0/16
      27000: 10.14.0.0/16 10.134.0.0/16
      27001: 10.14.0.0/16 10.134.0.0/16
      27010: 10.14.0.0/16 10.134.0.0/16
      27011: 10.14.0.0/16 10.134.0.0/16
