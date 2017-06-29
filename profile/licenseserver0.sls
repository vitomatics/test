## pillar file for the secondary license server

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
  servername: garbage.internal.sifive.com
  serverid: 000000000000
  vendors:
    xilinx:
      disttype: zip
      disturl: http://sfimages.internal.sifive.com/Xilinx/flexlm/linux_flexlm_v11.13.1.3.zip
  daemons:
    xilinxd:
      vendor: xilinx
      bindir: linux_flexlm_v11.13.1.3/lnx64.o
      port: 9998
      vport: 9999
      licenses:
        license-01:
          pillar: site:licenses:xilinx-01
