# SiFive Pillar setup for the salt master.

states:
  sfsalt: true

sfsalt:
  lookup:
    sfsalt.lookup.saltdir: /srv/salt
    sfsalt.lookup.pillardir: /srv/pillar
    sfsalt.lookup.formulardir: /srv/formulas

  formulas:
    - apache-formula
    - bind-formula

  nodegroups:
    login:
      - algol.internal.sifive.com
      - altair.internal.sifive.com
    compute:
      - algol.internal.sifive.com
      - altair.internal.sifive.com
      - gamma*.internal.sifive.com
      - i0.internal.sifive.com
      - i1.internal.sifive.com
      - b0.internal.sifive.com
    vmhost:
      - eddie.internal.sifive.com
      - marvin.internal.sifive.com
      - bender.internal.sifive.com


