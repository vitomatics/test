# SiFive Pillar setup for the salt master.

states:
  sfsalt: true

sfsalt:
  lookup:
    sfsalt.lookup.saltdir: /srv/salt
    sfsalt.lookup.pillardir: /srv/pillar
    sfsalt.lookup.formulardir: /srv/formulas

  formulas:
    apache-formula: true

  nodegroups:
    login:
      algol.internal.sifive.com: true
      altair.internal.sifive.com: true
    compute:
      algol.internal.sifive.com: true
      altair.internal.sifive.com: true
      gamma00.internal.sifive.com: true
      gamma01.internal.sifive.com: true
      gamma02.internal.sifive.com: true
      gamma03.internal.sifive.com: true
      gamma04.internal.sifive.com: true
      gamma05.internal.sifive.com: true
      gamma06.internal.sifive.com: true
      gamma07.internal.sifive.com: true
      i0.internal.sifive.com: true
      i1.internal.sifive.com: true
      b0.internal.sifive.com: true
    vmhost:
      eddie: true
      marvin: true


