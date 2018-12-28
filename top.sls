base:
  '*':
    - default

  'leia.internal.sifive.com':
    - subnet.he-unix01
    - profile.nameserver-semicaching
    - profile.timeserver
    - profile.dhcpserver-he-primary
    - profile.telegraf-ping-he-rack1
    - profile.ganglia-node-server
    - profile.telegraf-host-server
    - hosts.leia

  'luke.internal.sifive.com':
    - subnet.he-unix01
    - profile.nameserver-semicaching
    - profile.timeserver
    - profile.dhcpserver-he-secondary
    - profile.ganglia-node-server
    - profile.telegraf-host-server
    - hosts.luke

  'hansolo.internal.sifive.com':
    - subnet.sf-unix
    - profile.nameserver-semicaching
    - profile.timeserver
    - profile.dhcpserver-sf
    - profile.ganglia-node-server
    - profile.telegraf-host-server
    - profile.telegraf-ping-sm
    - profile.sfamtutil
    - profile.pinglog-sm
    - profile.snmp-client
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
    - profile.telegraf-host-server
    - hosts.dalek

  'vulcan.internal.sifive.com':
    - subnet.he-unix01
    - profile.backupclient
    - profile.ganglia-node-server
    - profile.telegraf-host-server
    - profile.slurm-cluster-sifive
    - profile.slurm-client
    - profile.webserver.system_auth
    - profile.site-jenkins
    - profile.jenkins-federation-server-default
    - profile.jenkins-webhook-server
    - profile.regresslog-webhook-server
    - hosts.vulcan

  'klingon.internal.sifive.com':
    - subnet.he-unix01
    - profile.webserver
    - profile.site-coverage
    - profile.ganglia-node-server
    - profile.telegraf-host-server
    - hosts.klingon

  'algol.internal.sifive.com':
    - subnet.sf-unix
    - profile.devel
    - profile.repos-src
    - profile.clusterclient
    - profile.login
    - profile.desktop
    - profile.slurm-cluster-sifive
    - profile.slurm-client
    - profile.nomachine-unlicensed
    - profile.sfamtutil
    - profile.ganglia-node-server
    - profile.telegraf-host-server
    - hosts.algol

  'altair.internal.sifive.com':
    - subnet.he-unix01
    - profile.devel
    - profile.repos-src
    - profile.clusterclient
    - profile.login
    - profile.desktop
    - profile.slurm-cluster-sifive
    - profile.slurm-client
    - profile.nomachine-licensed
    - profile.ganglia-node-server
    - profile.telegraf-host-server
    - hosts.altair

  'betel.internal.sifive.com':
    - subnet.he-unix01
    - profile.devel
    - profile.repos-src
    - profile.clusterclient
    - profile.login
    - profile.desktop
    - profile.slurm-cluster-sifive
    - profile.slurm-client
    - profile.x2go
    - profile.ganglia-node-server
    - profile.telegraf-host-server
    - hosts.betel

  'frogstar.internal.sifive.com':
    - subnet.he-unix01
    - profile.devel
    - profile.repos-src
    - profile.clusterclient
    - profile.login
    - profile.desktop
    - profile.slurm-cluster-sifive
    - profile.slurm-client
    - profile.nomachine-licensed
    - profile.ganglia-node-server
    - profile.telegraf-host-server
    - hosts.frogstar

  'eddie.internal.sifive.com':
    - subnet.he-unix01
    - profile.vmhost
    - vms
    - profile.ganglia-node-server
    - profile.telegraf-host-server
    - hosts.eddie

  'marvin.internal.sifive.com':
    - subnet.he-unix01
    - profile.vmhost
    - vms
    - profile.ganglia-node-server
    - profile.telegraf-host-server
    - hosts.marvin

  'colin.internal.sifive.com':
    - subnet.he-unix02
    - profile.vmhost
    - vms
    - profile.ganglia-node-server
    - profile.telegraf-host-server
    - hosts.colin

  'chappie.internal.sifive.com':
    - subnet.he-unix02
    - profile.vmhost
    - vms
    - profile.ganglia-node-server
    - profile.telegraf-host-server
    - hosts.chappie

  'bender.internal.sifive.com':
    - subnet.sf-unix
    - profile.vmhost
    - vms
    - profile.ganglia-node-server
    - profile.telegraf-host-server
    - hosts.bender

  'omega1.internal.sifive.com':
    - subnet.sf-unix
    - secret.sfdump-omega1
    - profile.backupserver
    - profile.ganglia-node-server
    - profile.telegraf-host-server
    - profile.telegraf-disk-zfs
    - hosts.omega1

  'heartofgold.internal.sifive.com':
    - subnet.he-unix01
    - secret.sfdump-heartofgold
    - profile.backupserver
    - profile.ganglia-node-server
    - profile.telegraf-host-server
    - profile.telegraf-disk-zfs
    - hosts.heartofgold

  'gamma*.internal.sifive.com':
    - subnet.he-dhcp
    - profile.devel
    - profile.repos-src
    - profile.clusterclient
    - profile.slurm-cluster-sifive
    - profile.slurm-client
    - profile.slurm-node
    - profile.jenkins-federation-slave
    - profile.jenkins-rootuser-access
    - profile.ganglia-node-compute
    - profile.telegraf-host-compute
    - hosts.gamma

  'sigma*.internal.sifive.com':
    - subnet.he-dhcp
    - profile.devel
    - profile.repos-src
    - profile.clusterclient
    - profile.slurm-cluster-sifive
    - profile.slurm-client
    - profile.slurm-node
    - profile.jenkins-federation-slave
    - profile.jenkins-rootuser-access
    - profile.ganglia-node-compute
    - profile.telegraf-host-compute
    - hosts.sigma

{#
  'gamma1[0-5].internal.sifive.com':
    - match: pcre
    - profile.slurm-node-slurmonly
#}

  'alpha.internal.sifive.com':
    - subnet.sf-unix
    - profile.devel
    - profile.clusterclient
    - profile.slurm-cluster-testbed
    - profile.slurm-client
    - profile.ganglia-node-server
    - profile.telegraf-host-server
    - hosts.alpha

  'b0.internal.sifive.com':
    - subnet.sf-unix
    - profile.devel
    - profile.clusterclient
    - profile.slurm-cluster-sifive
    - profile.slurm-client
    - profile.ganglia-node-server
    - profile.telegraf-host-server
    - hosts.b0

  'sandbox.internal.sifive.com':
    - subnet.he-unix02
    - profile.devel
    - profile.clusterclient
    - profile.slurm-cluster-sifive
    - profile.slurm-client
    - profile.jenkins-federation-slave
    - hosts.sandbox

  'timewarp.internal.sifive.com':
    - subnet.he-unix02
    - profile.telegraf-host-server
    - hosts.timewarp
    - profile.slurm-cluster-sifive
    - profile.slurm-client   
 
  'delta*.internal.sifive.com':
    - subnet.sf-unix
    - profile.devel
    - profile.clusterclient
    - profile.jenkins-federation-slave
    - profile.slurm-cluster-sifive
    - profile.slurm-client
    - profile.jenkins-rootuser-access
    - profile.sfamtutil
    - profile.fpgahost2
    - profile.snmp-client
    - profile.managed-nuc
    - profile.ganglia-node-server
    - profile.telegraf-host-server
    - profile.snmp-client
    - hosts.delta

  'epsilon*.internal.sifive.com':
    - profile.devel
    - profile.snmp-client
    - profile.clusterclient
    - profile.slurm-cluster-testbed
    - profile.slurm-client
    - profile.slurm-node
    - profile.jenkins-rootuser-access
    - profile.sfamtutil
    - profile.snmp-client
    - profile.managed-nuc
    - profile.boardtest-nfs
    - profile.ganglia-node-server
    - profile.telegraf-host-server

  'epsilon00.internal.sifive.com':
    - subnet.sf-unix
    - hosts.epsilon00
    
  'epsilon01.internal.sifive.com':
    - subnet.sf-unix
    - hosts.epsilon01

  'epsilon02.internal.sifive.com':
    - subnet.sf-unix
    - hosts.epsilon02
    
  'epsilon03.internal.sifive.com':
    - subnet.sf-unix
    - hosts.epsilon03
    
  'epsilon04.internal.sifive.com':
    - subnet.sf-unix
    - hosts.epsilon04

  'epsilon05.internal.sifive.com':
    - subnet.sf-unix
    - hosts.epsilon05

  'epsilon06.internal.sifive.com':
    - subnet.sf-unix
    - hosts.epsilon06

  'epsilon07.internal.sifive.com':
    - subnet.sf-unix
    - hosts.epsilon07

  'epsilon08.internal.sifive.com':
    - subnet.sf-unix
    - hosts.epsilon08

  'epsilon09.internal.sifive.com':
    - subnet.sf-unix
    - hosts.epsilon09

  'epsilon10.internal.sifive.com':
    - subnet.sf-unix
    - hosts.epsilon10

  'epsilon11.internal.sifive.com':
    - subnet.sf-unix
    - hosts.epsilon11

  'epsilon12.internal.sifive.com':
    - subnet.sf-unix
    - hosts.epsilon12

  'epsilon13.internal.sifive.com':
    - subnet.sf-unix
    - hosts.epsilon13

  'epsilon14.internal.sifive.com':
    - subnet.sf-unix
    - hosts.epsilon14

  'epsilon15.internal.sifive.com':
    - subnet.sf-unix
    - hosts.epsilon15

  'epsilon16.internal.sifive.com':
    - subnet.sf-unix
    - hosts.epsilon16

  'epsilon17.internal.sifive.com':
    - subnet.sf-unix
    - hosts.epsilon17

  'epsilon18.internal.sifive.com':
    - subnet.sf-unix
    - hosts.epsilon18

  'epsilon19.internal.sifive.com':
    - subnet.sf-unix
    - hosts.epsilon19

  'epsilon20.internal.sifive.com':
    - subnet.sf-unix
    - hosts.epsilon20

  'epsilon21.internal.sifive.com':
    - subnet.sf-unix
    - hosts.epsilon21
 
  'epsilon22.internal.sifive.com':
    - subnet.sf-unix
    - hosts.epsilon22

  'epsilon23.internal.sifive.com':
    - subnet.sf-unix
    - hosts.epsilon23

  'gravelpit.internal.sifive.com':
    - subnet.sf-dhcp
    - profile.clusterclient
    - profile.telegraf-host-server
    - hosts.gravelpit

  'hal.internal.sifive.com':
    - subnet.he-unix01
    - profile.saltmaster
    - profile.saltpinger
    - profile.awsmaster
    - profile.tfmaster
    - profile.ganglia-node-server
    - profile.telegraf-host-server
    - hosts.hal

  'viki.internal.sifive.com':
    - subnet.he-unix01
    - profile.saltmaster
    - profile.awsmaster
    - profile.ganglia-node-server
    - profile.telegraf-host-server
    - hosts.viki

  'tardis.internal.sifive.com':
    - subnet.he-unix01
    - profile.devel
    - profile.clustermaster
    - profile.ganglia-node-server
    - profile.telegraf-host-server
    - profile.edasync-smartdv-master
    - hosts.tardis

  'grid.internal.sifive.com':
    - subnet.he-unix01
    - profile.ganglia-server
    - profile.webserver.php
    - profile.site-gweb
    - profile.ganglia-node-server
    - profile.telegraf-host-server
    - profile.mysql-server-local
    - profile.mysql-slurmdbd-tweaks
    - profile.slurm-cluster-sifive
    - profile.slurm-client
    - profile.slurm-db
    - profile.slurm-server
    - profile.slurm-acct
    - profile.telegraf-slurm
    - profile.jenkins-rootuser-access
    - profile.backupclient
    - hosts.grid

  'matrix.internal.sifive.com':
    - subnet.he-unix01
    - profile.ganglia-server
    - profile.webserver.php
    - profile.site-gweb
    - profile.ganglia-node-server
    - profile.telegraf-host-server
    - hosts.matrix

  'transporter.internal.sifive.com':
    - subnet.he-unix01
    - profile.mailserver
    - profile.ganglia-node-server
    - profile.telegraf-host-server
    - hosts.transporter

  'yoda.internal.sifive.com':
    - subnet.he-unix01
    - profile.nameserver-auth
    - profile.sifive-noc
    - profile.awsmaster
    - profile.backupclient
    - profile.pinglog-he
    - profile.snmp-client
    - profile.ganglia-node-server
    - profile.telegraf-host-server
    - hosts.yoda

  'lambda00.internal.sifive.com':
    - subnet.he-iso01
    - default.iso
    - profile.psacct
    - profile.devel
    - profile.login
    - profile.desktop
    - profile.nomachine-eval
    - profile.edadirs-smartdv
    - profile.edasync-smartdv-slave
    - profile.backupclient
    - profile.localaccounts
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
    - profile.sfaccount-scripts
    - profile.ganglia-node-server
    - profile.telegraf-host-server
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
    - profile.localaccounts
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
    - profile.localaccounts
    - accounts.fpgatest-accounts
    - profile.devel
    - hosts.rhtest

  'wall-e.internal.sifive.com':
    - subnet.he-unix01
    - profile.ganglia-node-server
    - profile.telegraf-host-server
    - profile.rsyslog-server
    - profile.backupclient
    - hosts.wall-e

  'skynet.internal.sifive.com':
    - subnet.he-unix01
    - profile.snmp-client
    - profile.ganglia-node-server
    - profile.telegraf-host-server
    - profile.tig-sysmon
    - hosts.skynet

  'zarss.internal.sifive.com':
    - subnet.he-unix02
    - profile.login
    - profile.ganglia-node-server
    - profile.telegraf-host-server
    - profile.localaccounts
    - accounts.syslogin-accounts
    - hosts.zarss

  'romulan.internal.sifive.com':
    - subnet.he-unix02
    - profile.ganglia-node-server
    - profile.telegraf-host-server
    - profile.webserver.system_auth
    - profile.slurm-cluster-sifive
    - profile.slurm-client
    - profile.site-jenkinstest
    - profile.jenkins-federation-server-new
    - profile.regresslog-webhook-server
    - hosts.romulan

  'barnards.internal.sifive.com':
    - subnet.he-unix02
    - profile.devel
    - profile.repos-src
    - profile.clusterclient
    - profile.login
    - profile.desktop
    - profile.slurm-cluster-sifive
    - profile.slurm-client
    - profile.nomachine-licensed
    - profile.ganglia-node-server
    - profile.telegraf-host-server
    - hosts.barnards

  'barnards2.internal.sifive.com':
    - profile.nomachine-licensed

  'maul.internal.sifive.com':
    - subnet.he-unix02
    - profile.ganglia-node-server
    - profile.telegraf-host-server
    - hosts.maul

  'anakin.internal.sifive.com':
    - subnet.he-unix02
    - profile.nameserver-semicaching
    - profile.timeserver
    - profile.ganglia-node-server
    - profile.telegraf-host-server
    - hosts.anakin

  'magrathea.internal.sifive.com':
    - subnet.he-unix02
    - profile.debuilder
    - hosts.magrathea

  'gaia.internal.sifive.com':
    - subnet.he-unix02
    - profile.ganglia-node-server
    - profile.telegraf-host-server
    - profile.slurm-cluster-testbed
    - profile.slurm-client
    - profile.slurm-server
#    - profile.telegraf-slurm
#    - profile.jenkins-rootuser-access
    - hosts.gaia

  'terminus.internal.sifive.com':
    - subnet.he-unix02
    - profile.devel
    - profile.clusterclient
    - profile.slurm-cluster-testbed
    - profile.slurm-client
    - profile.slurm-node
    - profile.ganglia-node-server
    - profile.telegraf-host-server
    - hosts.terminus

