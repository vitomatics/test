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
  'b1.internal.sifive.com':
    - compute
    - hosts.b1

  'jenkins.internal.sifive.com':
    - hosts.jenkins
