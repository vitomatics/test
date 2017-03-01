## SiFive Pillar setup for the salt master.

{% set saltroot = '/srv/salt' %}

include:
  - secret.saltmaster

states:
  sfsalt.master: true

## Salt
sfsalt:
  lookup:
    statedir: {{saltroot}}/state
    pillardir: {{saltroot}}/pillar
    formuladir: {{saltroot}}/formula

  peers:
    - hal.internal.sifive.com
    - viki.internal.sifive.com

  master:
    timeout: 30

    state:
      origin: git@github-salt-states:sifive/salt-states.git
    pillar:
      origin: git@github-salt-pillar:sifive/salt-pillar.git

    formula:
      apache-formula:
        origin: https://github.com/saltstack-formulas/apache-formula.git
        rev: bf66e74
      bind-formula:
        origin: https://github.com/saltstack-formulas/bind-formula.git
        rev: 275140e

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
      saltmaster:
        - hal.internal.sifive.com
        - viki.internal.sifive.com

    ext_pillars:
      file_tree:
        root_dir: {{saltroot}}/pillar/file_tree
      cmd_yaml: '/usr/lib/sfsalt/pillar-pki %s'
      

## Salt master deploy keys
ssh:
  userconfig:
    root:
      github.com:
        User: git
        IdentitiesOnly: yes
      github-salt-states:
        HostName: github.com
        IdentityFile: /root/.ssh/id_rsa.salt-states
      github-salt-pillar:
        HostName: github.com
        IdentityFile: /root/.ssh/id_rsa.salt-pillar

file:
  file:
    /root/.ssh/id_rsa.salt-states:
      contents_pillar: 'keys:github:salt-states:private'
      user: root
      group: root
      mode: '0600'
    /root/.ssh/id_rsa.salt-pillar:
      contents_pillar: 'keys:github:salt-pillar:private'
      user: root
      group: root
      mode: '0600'


## Firewalling

firewall:
  ports:
    tcp:
      4505: 10.14.0.0/16
      4506: 10.14.0.0/16

