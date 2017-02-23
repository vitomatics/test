# SiFive Pillar setup for the salt master.

{% set saltdir = '/srv/salt' %}
{% set pillardir = '/srv/pillar' %}
{% set formuladir = '/srv/formulas' %}
{% set filetreedir = pillardir + '/' + 'file_tree' %}

states:
  sfsalt: true

sfsalt:
  lookup:
    sfsalt.lookup.saltdir: {{ saltdir }}
    sfsalt.lookup.pillardir: {{ pillardir }}
    sfsalt.lookup.formuladir: {{ formuladir }}

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
    cmd_yaml: '/usr/lib/sfsalt/pillar-pki %s'
      


