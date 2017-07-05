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
  servername: license1.internal.sifive.com
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
      bindir: cadence-flexlm-v11.13.1.3-sifive
      port: 5280
      vport: 5281
      licenses:
        cadence-02:
          pillar: site:licenses:cdslmd:cadence-02
        cadence-03:
          pillar: site:licenses:cdslmd:cadence-03
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
    smartdvd:
      vendor: smartdv
      bindir: smartdv-flexlm-20170216/lnx_64
      port: 5053
      vport: 5054
      licenses:
        smartdv-01:
          pillar: site:licenses:smartdv:smartdv-01
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
        synopsys-01:
          pillar: site:licenses:snpslmd:synopsys-01
        synopsys-04:
          pillar: site:licenses:snpslmd:synopsys-04
        synopsys-05:
          pillar: site:licenses:snpslmd:synopsys-05
        synopsys-06:
          pillar: site:licenses:snpslmd:synopsys-06
        synopsys-07:
          pillar: site:licenses:snpslmd:synopsys-07
        synopsys-08:
          pillar: site:licenses:snpslmd:synopsys-08
        synopsys-09:
          pillar: site:licenses:snpslmd:synopsys-09
        synopsys-10:
          pillar: site:licenses:snpslmd:synopsys-10
        synopsys-11:
          pillar: site:licenses:snpslmd:synopsys-11
        synopsys-12:
          pillar: site:licenses:snpslmd:synopsys-12


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
