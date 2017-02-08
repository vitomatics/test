## VM definitions

include:
  - vms.algol
  - vms.altair
  - vms.betel
  - vms.dalek
  - vms.klingon
  - vms.leia
  - vms.luke
  - vms.hansolo
  - vms.sandbox
  - vms.vulcan
  - vms.gravelpit
  
sfvirt:
  dists:
    xenial-default:
      libvirtos: ubuntu16.04
      type: debian-updates
      host: mirrors.kernel.org
      dir: ubuntu
      release: xenial
      arch: amd64
      preseed: http://install.internal.sifive.com/preseed/ubuntu
  
