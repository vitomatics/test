base:
  '*':
    - default

  'citadel.internal.sifive.com':
    - hosts.citadel

  'nihilanth.internal.sifive.com':
    - hosts.nihilanth

  'breencast.internal.sifive.com':
    - hosts.breencast

  'metrocop.internal.sifive.com':
    - hosts.metrocop

  'synth.internal.sifive.com':
    - hosts.synth

  'gonarch.internal.sifive.com':
    - hosts.gonarch

  'canal.internal.sifive.com':
    - hosts.canal

  'dalek.internal.sifive.com':
    - static-subnet.he-unix
    - hosts.dalek

  'algol.internal.sifive.com':
    - static-subnet.sf-unix
    - profile.login
    - hosts.algol

  'altair.internal.sifive.com':
    - static-subnet.he-unix
    - profile.login
    - hosts.altair

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

  'heartofgold.internal.sifive.com':
    - static-subnet.he-unix
    - profile.backuphost
    - hosts.heartofgold

  'combine.sifive.com':
    - xen.dom0

  'gamma*.internal.sifive.com':
    - profile.compute

  'i0.internal.sifive.com':
    - profile.compute
    - hosts.i0

  'i1.internal.sifive.com':
    - profile.compute

  'b0.internal.sifive.com':
    - profile.compute
    - profile.labhost
    - hosts.b0

  'jenkins.internal.sifive.com':
    - hosts.jenkins
