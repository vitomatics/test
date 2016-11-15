# SiFive Pillar setup for the salt master.

sfsalt:
  lookup:
    sfsalt.lookup.saltdir: /srv/salt
    sfsalt.lookup.pillardir: /srv/pillar
    sfsalt.lookup.formulardir: /srv/formulas

  formulas:
    apache-formula: true

  nodegroups:
    login:
      algol: true
      altair: true
    compute:
      algol: true
      altair: true
      gamma00: true
      gamma01: true
      gamma02: true
      gamma03: true
      gamma04: true
      gamma05: true
      gamma06: true
      gamma07: true
      i0: true
      i1: true
      b0: true
    vmhost:
      eddie: true
      marvin: true


