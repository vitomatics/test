## pillar file for main sifive license server

states:
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
    synopsys:
      disttype: tgz
      disturl: http://sfimages.internal.sifive.com/Synopsys/scl/scl-2016.12_SP1.tar.gz
    smartdv:
      disttype: tgz
      disturl: http://sfimages.internal.sifive.com/SmartDV/flexlm/smartdv-flexlm-20170216.tar.gz
    cadence:
      disttype: tgz
      disturl: http://sfimages.internal.sifive.com/Cadence/flexlm/cadence-flexlm-v11.13.1.3-sifive.tar.gz
    mentor:
      disttype: tgz
      disturl: http://sfimages.internal.sifive.com/Mentor/mgls/mgls-v11.13.1.2.tar.gz
  daemons:
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
    smartdvd:
      vendor: smartdv
      bindir: FIXME-smartdv-flexlm-20170216/lnx_64
      port: 5053
      vport: 5054
    cdslmd:
      vendor: cadence
      bindir: FIXME-cadence-flexlm-v11.13.1.3-sifive
      port: 5280
      vport: 5281
    mgcld:
      vendor: mentor
      bindir: FIXME-mgls-v11.13.1.2/bin
      port: 1717
      vport: 1718
