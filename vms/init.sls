## VM definitions

include:
  - vms.altair
  - vms.algol
  - vms.betel
  - vms.dalek
  - vms.frogstar
  - vms.grid
  - vms.gravelpit
  - vms.hal
  - vms.hansolo
  - vms.klingon
  - vms.leia
  - vms.luke
  - vms.matrix
  - vms.sandbox
  - vms.tardis
  - vms.transporter
  - vms.viki
  - vms.vulcan
  - vms.yoda
  
sfvirt:
  dists:
    xenial-default:
      libvirtos: ubuntu16.04
      type: debian-updates
      host: mirrors.kernel.org
      dir: ubuntu
      release: xenial
      arch: amd64
      preseedbase: http://install.internal.sifive.com/preseed/ubuntu
    xenial-pxe:
      libvirtos: ubuntu16.04
  
