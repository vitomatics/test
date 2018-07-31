## SiFive Pillar setup for the salt master.

{% set saltroot = '/srv/salt' %}

include:
  - secret.saltmaster

states:
  sfsalt.master: true
  rngd: true

## Salt
sfsalt:
  lookup:
    statedir: {{saltroot}}/state
    pillardir: {{saltroot}}/pillar
    customdir: {{saltroot}}/custom
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
    custom:
      origin: git@github-salt-custom:sifive/salt-custom.git

    formula:
      apache-formula:
        origin: git@github-salt-pillar:sifive/apache-formula.git
      php-formula:
        origin: git@github-salt-pillar:sifive/php-formula.git
      mysql-formula:
        origin: git@github-salt-pillar:sifive/mysql-formula.git
      slurm-formula:
        origin: git@github-salt-pillar:sifive/slurm-formula.git
      aptly-formula:
        origin: git@github-salt-pillar:sifive/aptly-formula.git
      bind-formula:
        origin: git@github-salt-pillar:sifive/bind-formula.git
      rsyslog-formula:
        origin: git@github-salt-pillar:sifive/salt-formula-rsyslog.git
      telegraf-formula:
        origin: git@github-salt-pillar:sifive/salt-formula-telegraf.git
      influxdb-formula:
        origin: git@github-salt-pillar:sifive/salt-formula-influxdb.git
      grafana-formula:
        origin: git@github-salt-pillar:sifive/salt-formula-grafana.git
      nginx-formula:
        origin: git@github-salt-pillar:sifive/salt-formula-nginx.git

        
    nodegroups:
      login:
        - algol.internal.sifive.com
        - altair.internal.sifive.com
        - betel.internal.sifive.com
        - frogstar.internal.sifive.com
        - lambda00.internal.sifive.com
      compute:
        - gamma*.internal.sifive.com
        - sigma*.internal.sifive.com
        - alpha.internal.sifive.com
        - b0.internal.sifive.com
        - delta*.internal.sifive.com
      devel:
        - algol.internal.sifive.com
        - alpha.internal.sifive.com
        - altair.internal.sifive.com
        - b0.internal.sifive.com
        - betel.internal.sifive.com
        - delta*.internal.sifive.com
        - frogstar.internal.sifive.com
        - gamma*.internal.sifive.com
        - sigma*.internal.sifive.com
        - lambda00.internal.sifive.com
        - tardis.internal.sifive.com
      vmhost:
        - eddie.internal.sifive.com
        - marvin.internal.sifive.com
        - bender.internal.sifive.com
      dhcpserver:
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
      slurmclient:
        - algol.internal.sifive.com
        - altair.internal.sifive.com
        - betel.internal.sifive.com
        - frogstar.internal.sifive.com
        - gamma*.internal.sifive.com
        - sigma*.internal.sifive.com
        - delta*.internal.sifive.com
        - alpha.internal.sifive.com
        - sandbox.internal.sifive.com
        - grid.internal.sifive.com
      slurmnode:
        - gamma*.internal.sifive.com
        - sigma*.internal.sifive.com
        - delta*.internal.sifive.com
        - alpha.internal.sifive.com
        - sandbox.internal.sifive.com
      slurmserver:
        - grid.internal.sifive.com
      authnameserver:
        - yoda.internal.sifive.com
      licenseserver:
        - jabba.internal.sifive.com
        - jarjar.internal.sifive.com
      unisolated:
        - algol.internal.sifive.com
        - alpha.internal.sifive.com
        - altair.internal.sifive.com
        - b0.internal.sifive.com
        - bender.internal.sifive.com
        - betel.internal.sifive.com
        - chappie.internal.sifive.com
        - colin.internal.sifive.com
        - dalek.internal.sifive.com
        - delta*.internal.sifive.com
        - eddie.internal.sifive.com
        - frogstar.internal.sifive.com
        - gamma*.internal.sifive.com
        - sigma*.internal.sifive.com
        - hal.internal.sifive.com
        - heartofgold.internal.sifive.com
        - gravelpit.internal.sifive.com
        - grid.internal.sifive.com
        - hansolo.internal.sifive.com
        - jabba.internal.sifive.com
        - jarjar.internal.sifive.com
        - klingon.internal.sifive.com
        - leia.internal.sifive.com
        - luke.internal.sifive.com
        - omega1.internal.sifive.com
        - marvin.internal.sifive.com
        - matrix.internal.sifive.com
        - mnuc00.internal.sifive.com
        - sandbox.internal.sifive.com
        - skynet.internal.sifive.com
        - tardis.internal.sifive.com
        - transporter.internal.sifive.com
        - vader.internal.sifive.com
        - viki.internal.sifive.com
        - vulcan.internal.sifive.com
        - wall-e.internal.sifive.com
        - yoda.internal.sifive.com
      isolated:
        - lambda00.internal.sifive.com

    ext_pillars:
      file_tree:
        root_dir: {{saltroot}}/pillar/file_tree
      cmd_yaml: '/usr/lib/sfsalt/pillar-pki %s'
      libvirt: 'libvirt'
      

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
      github-salt-custom:
        HostName: github.com
        IdentityFile: /root/.ssh/id_rsa.salt-custom

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
    /root/.ssh/id_rsa.salt-custom:
      contents_pillar: 'keys:github:salt-custom:private'
      user: root
      group: root
      mode: '0600'


## Firewalling

firewall:
  ports:
    tcp:
      4505: 10.14.0.0/16 10.134.0.0/16
      4506: 10.14.0.0/16 10.134.0.0/16

