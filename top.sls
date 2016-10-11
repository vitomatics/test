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

  'canal.internal.sifive.com':
    - hosts.canal

  'algol.internal.sifive.com':
    - sf
    - login
    - hosts.algol

  'eddie.internal.sifive.com':
    - he
    - vmhost
    - vms
    - hosts.eddie

  'marvin.internal.sifive.com':
    - he
    - vmhost
    - vms
    - hosts.marvin

  'heartofgold.internal.sifive.com':
    - he
    - backuphost
    - hosts.heartofgold

  'combine.sifive.com':
    - xen.dom0

  'gamma*.internal.sifive.com':
    - compute

  'gamma07.internal.sifive.com':
    - hosts.gamma07

  'i*.internal.sifive.com':
    - compute

  'b0.internal.sifive.com':
    - compute
    - hosts.b0

  'jenkins.internal.sifive.com':
    - hosts.jenkins
