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
  # servername: license.internal.sifive.com
  # serverid: 0002c94e201e
  servername: garbage.internal.sifive.com
  serverid: '0123456789ab'
  vendors:
    cadence:
      disttype: tgz
      disturl: http://sfimages.internal.sifive.com/Cadence/flexlm/cadence-flexlm-v11.13.1.3-sifive.tar.gz
    mentor:
      disttype: tgz
      disturl: http://sfimages.internal.sifive.com/Mentor/mgls/mgls-v11.13.1.2.tar.gz
    smartdv:
      disttype: tgz
      disturl: http://sfimages.internal.sifive.com/SmartDV/flexlm/smartdv-flexlm-20170216.tar.gz
    synopsys:
      disttype: tgz
      disturl: http://sfimages.internal.sifive.com/Synopsys/scl/scl-2016.12_SP1.tar.gz
    tsmc:
      disttype: tgz
      disturl: http://sfimages.internal.sifive.com/TSMC/flexlm/MC2_2012.02.00.d-flexlm.tar.gz
  daemons:
    cdslmd:
      vendor: cadence
      bindir: FIXME-cadence-flexlm-v11.13.1.3-sifive
      port: 5280
      vport: 5281
    interrad:
      vendor: tsmc
      bindir: FIXME-MC2_2012.02.00.d/aux/flexlm/amd64_re3
      port: 27010
      vport: 27011
    mgcld:
      vendor: mentor
      bindir: FIXME-mgls-v11.13.1.2/bin
      port: 1717
      vport: 1719
      licenses:
        test1:
          pillar: site:licenses:test1
    smartdvd:
      vendor: smartdv
      bindir: FIXME-smartdv-flexlm-20170216/lnx_64
      port: 5053
      vport: 5054
    snpslmd:
      vendor: synopsys
      bindir: FIXME-scl/2016.12_SP1/linux64/bin
      port: 27000
      vport: 27001
      env: SCL_POOL_VS=1
      licenses:
        license1:
          absent: true
        license2:
          absent: true


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
