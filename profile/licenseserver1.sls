## pillar file for main sifive license server

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
      disturl: http://sfimages.internal.sifive.com/Mentor/mgls/mgls-v11.13.1.2.tar.gz
      dir: mgls-v11.13.1.2
    smartdv:
      disttype: tgz
      disturl: http://sfimages.internal.sifive.com/SmartDV/flexlm/smartdv-flexlm-20170216.tar.gz
      dir: smartdv-flexlm-20170216
    synopsys:
      disttype: tgz
      disturl: http://sfimages.internal.sifive.com/Synopsys/scl/scl-2016.12_SP1.tar.gz
      dir: scl/2016.12_SP1
    tsmc:
      disttype: tgz
      disturl: http://sfimages.internal.sifive.com/TSMC/flexlm/MC2_2012.02.00.d-flexlm.tar.gz
      dir: MC2_2012.02.00.d
  daemons:
    cdslmd:
      vendor: cadence
      bindir: cadence-flexlm-v11.13.1.3-sifive/bin
      port: 5280
      vport: 5281
      licenses:
        cadence-20170906:
          absent: true
        cadence-20170915:
          absent: true
        cadence-20171012:
          absent: true
        cadence-20180108:
          pillar: site:licenses:cdslmd:cadence-20180108
        cadence-20180110:
          pillar: site:licenses:cdslmd:cadence-20180110
        cadence-20180211:
          pillar: site:licenses:cdslmd:cadence-20180211
        cadence-20180220:
          pillar: site:licenses:cdslmd:cadence-20180220
        cadence-20180305:
          pillar: site:licenses:cdslmd:cadence-20180305
        cadence-20180307:
          pillar: site:licenses:cdslmd:cadence-20180307
    interrad:
      vendor: tsmc
      bindir: MC2_2012.02.00.d/aux/flexlm/amd64_re3
      port: 27010
      vport: 27011
      licenses:
        tsmc-sram-3864:
          pillar: site:licenses:interrad:tsmc-sram-3864
        tsmc-sram-4077:
          pillar: site:licenses:interrad:tsmc-sram-4077
        tsmc-sram-5056:
          pillar: site:licenses:interrad:tsmc-sram-5056
    mgcld:
      vendor: mentor
      bindir: mgls-v11.13.1.2/bin
      port: 1717
      vport: 1718
      licenses:
        microsemi-01:
          pillar: site:licenses:mgcld:microsemi-01
        microsemi-02:
          pillar: site:licenses:mgcld:microsemi-02
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
      bindir: scl/2016.12_SP1/linux64/bin
      port: 27000
      vport: 27001
      env: SCL_POOL_VS=1
      licenses:
        microsemi-01:
          pillar: site:licenses:snpslmd:microsemi-01
        microsemi-02:
          pillar: site:licenses:snpslmd:microsemi-02
        synopsys-20171005:
          pillar: site:licenses:snpslmd:synopsys-20171005
        synopsys-20171029:
          absent: true
        synopsys-20171206:
          absent: true
        synopsys-20180208:
          pillar: site:licenses:snpslmd:synopsys-20180208
        synopsys-20180306:
          pillar: site:licenses:snpslmd:synopsys-20180306
        synopsys-20180307:
          pillar: site:licenses:snpslmd:synopsys-20180307
        synopsys-20180307b:
          pillar: site:licenses:snpslmd:synopsys-20180307b
        synopsys-20180314a:
          pillar: site:licenses:snpslmd:synopsys-20180314a
        synopsys-20180314b:
          pillar: site:licenses:snpslmd:synopsys-20180314b
        synopsys-20180314c:
          pillar: site:licenses:snpslmd:synopsys-20180314c
        synopsys-20180315:
          pillar: site:licenses:snpslmd:synopsys-20180315
        synopsys-20180327:
          pillar: site:licenses:snpslmd:synopsys-20180327


## Firewall holes for flexnet server
firewall:
  ports:
    tcp:
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
