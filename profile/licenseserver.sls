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
  servername: license.internal.sifive.com
  serverid: 0002c94e201e
  vendors:
    synopsys:
      disttype: tgz
      disturl: http://sfimages/Synopsys/scl/scl-sifive-20170628.tar.gz
  daemons:
    snpslmd:
      vendor: synopsys
      bindir: scl/2016.12_SP1/linux/bin
      port: 27000
      vport: 27001
      env: SCL_POOL_VS=1
      licenses:
        license1:
          absent: true
        license2:
          pillar: site:licenses:synopsys-10
