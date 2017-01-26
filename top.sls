base:
  '*':
    - default

  'citadel.internal.sifive.com':
    - subnet.sf-unix
    - hosts.citadel

  'nihilanth.internal.sifive.com':
    - subnet.sf-unix
    - profile.backupclient
    - hosts.nihilanth

  'leia.internal.sifive.com':
    - subnet.he-unix01
    - profile.nameserver-semicaching
    - profile.timeserver
    - hosts.leia

  'luke.internal.sifive.com':
    - subnet.he-unix01
    - profile.nameserver-semicaching
    - profile.timeserver
    - hosts.luke

  'hansolo.internal.sifive.com':
    - subnet.sf-unix
    - profile.nameserver-semicaching
    - profile.timeserver
    - hosts.hansolo

  'breencast.internal.sifive.com':
    - subnet.sf-unix
    - profile.backupclient
    - hosts.breencast

  'metrocop.internal.sifive.com':
    - subnet.sf-unix
    - hosts.metrocop

  'synth.internal.sifive.com':
    - subnet.sf-unix
    - hosts.synth

  'gonarch.internal.sifive.com':
    - subnet.sf-unix
    - profile.saltmaster
    - profile.backupclient
    - hosts.gonarch

  'canal.internal.sifive.com':
    - subnet.sf-unix
    - hosts.canal

  'dalek.internal.sifive.com':
    - subnet.he-unix01
    - profile.tftp-sysadmin
    - profile.webserver
    - profile.site-sfrepo
    - profile.site-sfimages
    - profile.site-pxe
    - profile.site-install
    - profile.backupclient
    - hosts.dalek

  'vulcan.internal.sifive.com':
    - subnet.he-unix01
    - profile.gocd-server
    - profile.backupclient
    - hosts.vulcan

  'klingon.internal.sifive.com':
    - subnet.he-unix01
    - profile.webserver
    - profile.site-coverage
    - hosts.klingon

  'algol.internal.sifive.com':
    - subnet.sf-unix
    - profile.login
    - profile.nomachine
    - hosts.algol

  'altair.internal.sifive.com':
    - subnet.he-unix01
    - profile.login
    - profile.nomachine
    - hosts.altair

  'betel.internal.sifive.com':
    - subnet.he-unix01
    - profile.login
    - profile.x2go
    - hosts.betel

  'eddie.internal.sifive.com':
    - subnet.he-unix01
    - profile.vmhost
    - vms
    - hosts.eddie

  'marvin.internal.sifive.com':
    - subnet.he-unix01
    - profile.vmhost
    - vms
    - hosts.marvin

  'bender.internal.sifive.com':
    - subnet.sf-unix
    - profile.vmhost
    - vms
    - hosts.bender

  'omega1.internal.sifive.com':
    - subnet.sf-unix
    - profile.backupserver
    - hosts.omega1

  'heartofgold.internal.sifive.com':
    - subnet.he-unix01
    - profile.backupserver
    - hosts.heartofgold

  'combine.sifive.com':
    - subnet.sf-unix
    - xen.dom0

  'gamma*.internal.sifive.com':
    - subnet.he-dhcp
    - profile.compute
    - hosts.gamma

  'i0.internal.sifive.com':
    - subnet.sf-unix
    - profile.compute
    - profile.labhost
    - profile.backupclient
    - hosts.i0

  'b0.internal.sifive.com':
    - subnet.sf-unix
    - profile.compute
    - profile.labhost
    - hosts.b0

  'jenkins.internal.sifive.com':
    - subnet.sf-unix
    - hosts.jenkins

  'sandbox.internal.sifive.com':
    - subnet.he-unix01
    - profile.dhcpserver-he-secondary
    - hosts.sandbox
