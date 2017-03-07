base:
  '*':
    - default

  'nihilanth.internal.sifive.com':
    - subnet.sf-unix
    - profile.backupclient
    - hosts.nihilanth

  'leia.internal.sifive.com':
    - subnet.he-unix01
    - profile.nameserver-semicaching
    - profile.timeserver
    - profile.dhcpserver-he-primary
    - profile.ganglia-node-server
    - hosts.leia

  'luke.internal.sifive.com':
    - subnet.he-unix01
    - profile.nameserver-semicaching
    - profile.timeserver
    - profile.dhcpserver-he-secondary
    - profile.ganglia-node-server
    - hosts.luke

  'hansolo.internal.sifive.com':
    - subnet.sf-unix
    - profile.nameserver-semicaching
    - profile.timeserver
    - profile.dhcpserver-sf
    - profile.ganglia-node-server
    - hosts.hansolo

  'breencast.internal.sifive.com':
    - subnet.sf-unix
    - profile.ldapmaster
    - profile.backupclient
    - hosts.breencast

  'metrocop.internal.sifive.com':
    - subnet.sf-unix
    - hosts.metrocop

  'synth.internal.sifive.com':
    - subnet.sf-unix
    - hosts.synth

  'gonarch.internal.sifive.com':
    - subnet.sf-unix
    - profile.backupclient
    - hosts.gonarch

  'canal.internal.sifive.com':
    - subnet.sf-unix
    - profile.mailserver
    - profile.ganglia-node-server
    - hosts.canal

  'dalek.internal.sifive.com':
    - subnet.he-unix01
    - profile.tftp-sysadmin
    - profile.webserver
    - profile.site-sfrepo
    - profile.site-sfimages
    - profile.site-pxe
    - profile.site-install
    - profile.preseed-ubuntu
    - profile.backupclient
    - profile.ganglia-node-server
    - hosts.dalek

  'vulcan.internal.sifive.com':
    - subnet.he-unix01
    - profile.gocd-server
    - profile.backupclient
    - profile.ganglia-node-server
    - hosts.vulcan

  'klingon.internal.sifive.com':
    - subnet.he-unix01
    - profile.webserver
    - profile.site-coverage
    - profile.ganglia-node-server
    - hosts.klingon

  'algol.internal.sifive.com':
    - subnet.sf-unix
    - profile.devel
    - profile.clusterclient
    - profile.login
    - profile.nomachine-eval
    - profile.ganglia-node-server
    - hosts.algol

  'altair.internal.sifive.com':
    - subnet.he-unix01
    - profile.devel
    - profile.clusterclient
    - profile.login
    - profile.nomachine-licensed
    - profile.ganglia-node-server
    - hosts.altair

  'betel.internal.sifive.com':
    - subnet.he-unix01
    - profile.devel
    - profile.clusterclient
    - profile.login
    - profile.x2go
    - profile.ganglia-node-server
    - hosts.betel

  'eddie.internal.sifive.com':
    - subnet.he-unix01
    - profile.vmhost
    - vms
    - profile.ganglia-node-server
    - hosts.eddie

  'marvin.internal.sifive.com':
    - subnet.he-unix01
    - profile.vmhost
    - vms
    - profile.ganglia-node-server
    - hosts.marvin

  'bender.internal.sifive.com':
    - subnet.sf-unix
    - profile.vmhost
    - vms
    - profile.ganglia-node-server
    - hosts.bender

  'omega1.internal.sifive.com':
    - subnet.sf-unix
    - profile.backupserver
    - profile.ganglia-node-server
    - hosts.omega1

  'heartofgold.internal.sifive.com':
    - subnet.he-unix01
    - profile.backupserver
    - profile.ganglia-node-server
    - hosts.heartofgold

  'combine.sifive.com':
    - subnet.sf-unix
    - xen.dom0

  'gamma*.internal.sifive.com':
    - subnet.he-dhcp
    - profile.devel
    - profile.clusterclient
    - profile.ganglia-node-compute
    - hosts.gamma

  'i0.internal.sifive.com':
    - subnet.sf-unix
    - profile.devel
    - profile.clusterclient
    - profile.labhost
    - profile.backupclient
    - hosts.i0

  'b0.internal.sifive.com':
    - subnet.sf-unix
    - profile.devel
    - profile.clusterclient
    - profile.labhost
    - profile.ganglia-node-server
    - hosts.b0

  'jenkins.internal.sifive.com':
    - subnet.sf-unix
    - profile.ganglia-node-server
    - hosts.jenkins

  'sandbox.internal.sifive.com':
    - subnet.he-unix01
    - profile.devel
    - profile.clusterclient
    - profile.ganglia-node-server
    - hosts.sandbox

  'nuc1.internal.sifive.com':
    - subnet.sf-dhcp
    - hosts.nuc1

  'gravelpit.internal.sifive.com':
    - subnet.sf-dhcp
    - hosts.gravelpit

  'hal.internal.sifive.com':
    - subnet.he-unix01
    - profile.saltmaster
    - profile.ganglia-node-server
    - hosts.hal

  'viki.internal.sifive.com':
    - subnet.he-unix01
    - profile.saltmaster
    - profile.ganglia-node-server
    - hosts.viki

  'tardis.internal.sifive.com':
    - subnet.he-unix01
    - profile.devel
    - profile.clustermaster
    - profile.ganglia-node-server
    - hosts.tardis

  'grid.internal.sifive.com':
    - subnet.sf-unix
    - profile.ganglia-server
    - profile.webserver.php
    - profile.site-gweb
    - profile.ganglia-node-server
    - hosts.grid

  'matrix.internal.sifive.com':
    - subnet.sf-unix
    - profile.ganglia-server
    - profile.webserver.php
    - profile.site-gweb
    - profile.ganglia-node-server
    - hosts.matrix
