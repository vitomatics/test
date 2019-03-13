## pillar file for the third license server - licserver3

include:
  - profile.licenseserver


flexnet:
  servername: licserver3.internal.sifive.com
  serverid: '0002C94E201F'
  vendors:
    synopsys:
      disttype: tgz
      disturl: http://sfimages.internal.sifive.com/Synopsys/scl/scl-2018.06.tar.gz
      dir: scl/2018.06
  daemons:
    # Third Synopsys server - note the main one is on licenseserver0
    snpslmd:
      vendor: synopsys
      bindir: scl/2018.06/linux64/bin
      port: 27020
      vport: 27001
      env: SCL_POOL_VS=1
      licenses:
        synopsys-temp-20190312:
          pillar: site:licenses:snpslmd:synopsys-temp-20190312

## Firewall holes for flexnet server
firewall:
  ports:
    tcp:
      27020: 10.14.0.0/16 10.134.0.0/16
      27021: 10.14.0.0/16 10.134.0.0/16
