base:
  '*':
    - default

  'citadel.internal.sifive.com':
    - hosts.citadel

  'nihilanth.internal.sifive.com':
    - profile.backupclient
    - hosts.nihilanth

  'leia.internal.sifive.com':
    - static-subnet.he-unix
    - profile.nameserver-semicaching
    - profile.timeserver
    - hosts.leia

  'luke.internal.sifive.com':
    - static-subnet.he-unix
    - profile.nameserver-semicaching
    - profile.timeserver
    - hosts.luke

  'hansolo.internal.sifive.com':
    - static-subnet.sf-unix
    - hosts.hansolo

  'breencast.internal.sifive.com':
    - profile.backupclient
    - hosts.breencast

  'metrocop.internal.sifive.com':
    - hosts.metrocop

  'synth.internal.sifive.com':
    - hosts.synth

  'gonarch.internal.sifive.com':
    - profile.saltmaster
    - hosts.gonarch

  'canal.internal.sifive.com':
    - hosts.canal

  'dalek.internal.sifive.com':
    - static-subnet.he-unix
    - profile.tftp-sysadmin
    - profile.webserver
    - profile.site-sfrepo
    - profile.site-sfimages
    - hosts.dalek

  'vulcan.internal.sifive.com':
    - static-subnet.he-unix
    - profile.gocd-server
    - profile.backupclient
    - hosts.vulcan

  'klingon.internal.sifive.com':
    - static-subnet.he-unix
    - profile.webserver
    - profile.site-coverage
    - hosts.klingon

  'algol.internal.sifive.com':
    - static-subnet.sf-unix
    - profile.login
    - profile.nomachine
    - hosts.algol

  'altair.internal.sifive.com':
    - static-subnet.he-unix
    - profile.login
    - profile.nomachine
    - hosts.altair

  'betel.internal.sifive.com':
    - static-subnet.he-unix
    - profile.login
    - profile.x2go
    - hosts.betel

  'eddie.internal.sifive.com':
    - static-subnet.he-unix
    - profile.vmhost
    - vms
    - hosts.eddie

  'marvin.internal.sifive.com':
    - static-subnet.he-unix
    - profile.vmhost
    - vms
    - hosts.marvin

  'bender.internal.sifive.com':
    - static-subnet.sf-unix
    - profile.vmhost
    - vms
    - hosts.bender

  'omega1.internal.sifive.com':
    - static-subnet.sf-unix
    - profile.backupserver
    - hosts.omega1

  'heartofgold.internal.sifive.com':
    - static-subnet.he-unix
    - profile.backupserver
    - hosts.heartofgold

  'combine.sifive.com':
    - xen.dom0

  'gamma*.internal.sifive.com':
    - profile.compute
    - hosts.gamma

  'i0.internal.sifive.com':
    - profile.compute
    - profile.labhost
    - profile.backupclient
    - hosts.i0

  'b0.internal.sifive.com':
    - profile.compute
    - profile.labhost
    - hosts.b0

  'jenkins.internal.sifive.com':
    - hosts.jenkins

  'sandbox.internal.sifive.com':
    - profile.compute
    - hosts.sandbox
