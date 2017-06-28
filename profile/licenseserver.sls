## pillar file for main sifive license server

states:
  flexnet: true

flexnet:
  lookup:
    logdir: /srv/flexlm/log
    licensedir: /srv/flexlm/licenses
    user: flexlm
    group: nogroup
  servername: license.internal.sifive.com
  serverid: 0002c94e201e
  daemons:
    snpslmd:
      bindir: /srv/flexlm/vendor/synopsys/bin
      env: SCL_POOL_VS=1
      licenses:
        license1:
          absent: true
        license2:
          pillar: site:licenses:synopsys-10
      port: 27000
      vport: 27001
