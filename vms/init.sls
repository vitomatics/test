## VM definitions

include:
  - vms.algol
  - vms.altair
  - vms.betel
  - vms.dalek
  - vms.hal
  - vms.klingon
  - vms.leia
  - vms.luke
  - vms.hansolo
  - vms.sandbox
  - vms.tardis
  - vms.viki
  - vms.vulcan
  - vms.gravelpit
  - vms.grid
  - vms.matrix
  
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
  
