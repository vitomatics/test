## pillar file for main sifive license server

states:
  firewall.iptables: true
  flexnet: true

flexnet:
  lookup:
    logdir: /srv/flexlm/log
    licensedir: /srv/flexlm/licenses
    downloaddir: /srv/flexlm/downloads
    vendordir: /srv/flexlm/vendor
    user: flexlm
    group: nogroup
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
        cadence-20170712:
          absent: true
        cadence-20170726:
          pillar: site:licenses:cdslmd:cadence-20170726
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
        mentor-01:
          pillar: site:licenses:mgcld:mentor-01
        mentor-02:
          pillar: site:licenses:mgcld:mentor-02
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
        smartdv-01:
          absent: true
        smartdv-2017070601:
          pillar: site:licenses:smartdv:smartdv-2017070601
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
        synopsys-20170714:
          absent: true
        synopsys-20170728-0:
          pillar: site:licenses:snpslmd:synopsys-20170728-0
        synopsys-20170728-1:
          pillar: site:licenses:snpslmd:synopsys-20170728-1
        synopsys-20170728-2:
          pillar: site:licenses:snpslmd:synopsys-20170728-2
        synopsys-20170802:
          pillar: site:licenses:snpslmd:synopsys-20170802
        synopsys-20170804:
          pillar: site:licenses:snpslmd:synopsys-20170804


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
