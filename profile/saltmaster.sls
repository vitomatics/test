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
    - dhcpd-formula

  nodegroups:
    login:
      - algol.internal.sifive.com
      - altair.internal.sifive.com
      - betel.internal.sifive.com
    compute:
      - gamma*.internal.sifive.com
      - i0.internal.sifive.com
      - b0.internal.sifive.com
    user:
      - algol.internal.sifive.com
      - altair.internal.sifive.com
      - betel.internal.sifive.com
      - gamma*.internal.sifive.com
      - i0.internal.sifive.com
      - b0.internal.sifive.com
    vmhost:
      - eddie.internal.sifive.com
      - marvin.internal.sifive.com
      - bender.internal.sifive.com
    dhcpserver:
      - sandbox.internal.sifive.com
      - hansolo.internal.sifive.com
      - leia.internal.sifive.com
      - luke.internal.sifive.com

  ext_pillars:
    file_tree:
      root_dir: {{ filetreedir}}
      


