# SiFive Pillar setup for the salt master.

{% set saltroot = '/srv/salt' %}

states:
  sfsalt.master: true

sfsalt:
  lookup:
    sfsalt.lookup.saltdir: {{saltroot}}/salt
    sfsalt.lookup.pillardir: {{saltroot}}/pillar
    sfsalt.lookup.formuladir: {{saltroot}}/formulas

  master:
    formulas:
      - apache-formula
      - bind-formula
      - salt-formula

    nodegroups:
      login:
        - algol.internal.sifive.com
        - altair.internal.sifive.com
        - betel.internal.sifive.com
      compute:
        - gamma*.internal.sifive.com
        - i0.internal.sifive.com
        - b0.internal.sifive.com
      devel:
        - algol.internal.sifive.com
        - altair.internal.sifive.com
        - betel.internal.sifive.com
        - gamma*.internal.sifive.com
        - i0.internal.sifive.com
        - b0.internal.sifive.com
        - tardis.internal.sifive.com
      vmhost:
        - eddie.internal.sifive.com
        - marvin.internal.sifive.com
        - bender.internal.sifive.com
      dhcpserver:
        - sandbox.internal.sifive.com
        - hansolo.internal.sifive.com
        - leia.internal.sifive.com
        - luke.internal.sifive.com
      pxeserver:
        - dalek.internal.sifive.com
      installserver:
        - dalek.internal.sifive.com
      salthost:
        - hal.internal.sifive.com
        - viki.internal.sifive.com

    ext_pillars:
      file_tree:
        root_dir: {{ filetreedir}}
      
firewall:
  ports:
    tcp:
      4505: 10.14.0.0/16
      4506: 10.14.0.0/16

