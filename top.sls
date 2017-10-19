base:
  '*':
    - default

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
    - profile.sfamtutil
    - profile.pinglog-sm
    - hosts.hansolo

  'dalek.internal.sifive.com':
    - subnet.he-unix01
    - profile.tftp-sysadmin
    - profile.webserver.install
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
    - profile.backupclient
    - profile.ganglia-node-server
    - profile.webserver.system_auth
    - profile.site-jenkins
    - profile.jenkins-server
    - profile.jenkins-webhook-server
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
    - profile.repos-src
    - profile.clusterclient
    - profile.login
    - profile.slurm-client
    - profile.nomachine-eval
    - profile.sfamtutil
    - profile.ganglia-node-server
    - hosts.algol

  'altair.internal.sifive.com':
    - subnet.he-unix01
    - profile.devel
    - profile.repos-src
    - profile.clusterclient
    - profile.login
    - profile.slurm-client
    - profile.nomachine-licensed
    - profile.ganglia-node-server
    - hosts.altair

  'betel.internal.sifive.com':
    - subnet.he-unix01
    - profile.devel
    - profile.repos-src
    - profile.clusterclient
    - profile.login
    - profile.slurm-client
    - profile.x2go
    - profile.ganglia-node-server
    - hosts.betel

  'frogstar.internal.sifive.com':
    - subnet.he-unix01
    - profile.devel
    - profile.repos-src
    - profile.clusterclient
    - profile.login
    - profile.slurm-client
    - profile.nomachine-licensed
    - profile.ganglia-node-server
    - hosts.frogstar

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
    - secret.sfdump-omega1
    - profile.backupserver
    - profile.ganglia-node-server
    - hosts.omega1

  'heartofgold.internal.sifive.com':
    - subnet.he-unix01
    - secret.sfdump-heartofgold
    - profile.backupserver
    - profile.ganglia-node-server
    - hosts.heartofgold

  'gamma*.internal.sifive.com':
    - subnet.he-dhcp
    - profile.devel
    - profile.repos-src
    - profile.clusterclient
    - profile.slurm-client
    - profile.slurm-node
    - profile.jenkins-slave
    - profile.ganglia-node-compute
    - hosts.gamma

{#
  'gamma1[0-5].internal.sifive.com':
    - match: pcre
    - profile.slurm-node-slurmonly
#}

  'alpha.internal.sifive.com':
    - subnet.sf-unix
    - profile.devel
    - profile.clusterclient
    - profile.labhost
    - profile.jenkins-slave
    - profile.ganglia-node-server
    - hosts.alpha

  'b0.internal.sifive.com':
    - subnet.sf-unix
    - profile.devel
    - profile.clusterclient
    - profile.labhost
    - profile.jenkins-slave
    - profile.ganglia-node-server
    - hosts.b0

  'sandbox.internal.sifive.com':
    - subnet.he-unix01
    - profile.devel
    - profile.clusterclient
    - profile.slurm-client
    - profile.slurm-node
    - hosts.sandbox

  'nuc2.internal.sifive.com':
    - subnet.he-iso01
    - default.iso
    - profile.login
    - hosts.nuc2

  'delta*.internal.sifive.com':
    - subnet.sf-unix
    - profile.devel
    - profile.clusterclient
    - profile.jenkins-slave
    - profile.sfamtutil
    - profile.fpgahost
    - profile.managed-nuc
    - hosts.delta

  'gravelpit.internal.sifive.com':
    - subnet.sf-dhcp
    - hosts.gravelpit

  'hal.internal.sifive.com':
    - subnet.he-unix01
    - profile.saltmaster
    - profile.awsmaster
    - profile.ganglia-node-server
    - hosts.hal

  'viki.internal.sifive.com':
    - subnet.he-unix01
    - profile.saltmaster
    - profile.awsmaster
    - profile.ganglia-node-server
    - hosts.viki

  'tardis.internal.sifive.com':
    - subnet.he-unix01
    - profile.devel
    - profile.clustermaster
    - profile.ganglia-node-server
    - profile.edasync-smartdv-master
    - hosts.tardis

  'grid.internal.sifive.com':
    - subnet.he-unix01
    - profile.ganglia-server
    - profile.webserver.php
    - profile.site-gweb
    - profile.ganglia-node-server
    - profile.mysql-server-local
    - profile.slurm-db
    - profile.slurm-server
    - profile.slurm-acct
    - profile.backupclient
    - hosts.grid

  'matrix.internal.sifive.com':
    - subnet.he-unix01
    - profile.ganglia-server
    - profile.webserver.php
    - profile.site-gweb
    - profile.ganglia-node-server
    - hosts.matrix

  'transporter.internal.sifive.com':
    - subnet.he-unix01
    - profile.mailserver
    - profile.ganglia-node-server
    - hosts.transporter

  'yoda.internal.sifive.com':
    - subnet.he-unix01
    - profile.nameserver-auth
    - profile.sifive-noc
    - profile.awsmaster
    - profile.backupclient
    - profile.pinglog-he
    - hosts.yoda

  'lambda00.internal.sifive.com':
    - subnet.he-iso01
    - default.iso
    - profile.psacct
    - profile.devel
    - profile.login
    - profile.nomachine-eval
    - profile.edadirs-smartdv
    - profile.edasync-smartdv-slave
    - profile.backupclient
    - accounts.lambda00-accounts
    - hosts.lambda00

  'jarjar.internal.sifive.com':
    - subnet.he-unix01
    - profile.container
    - profile.licenseserver0
    - profile.backupclient
    - hosts.jarjar

  'vader.internal.sifive.com':
    - subnet.he-unix01
    - profile.kerberos-master
    - profile.kerberos-client
    - profile.ldapmaster2
    - profile.ganglia-node-server
    - profile.backupclient
    - hosts.vader

  'jabba.internal.sifive.com':
    - subnet.he-unix01
    - profile.container
    - profile.licenseserver1
    - profile.backupclient
    - hosts.jabba

  'fpgatest.internal.sifive.com':
    - subnet.aws-unix
    - accounts.fpgatest-accounts
    - profile.devel
    - hosts.fpgatest

  'awstest.internal.sifive.com':
    - subnet.aws-unix
    - profile.devel
    - profile.clusterclient
    - hosts.awstest

  'rhtest.internal.sifive.com':
    - subnet.aws-unix
    - accounts.fpgatest-accounts
    - hosts.rhtest
