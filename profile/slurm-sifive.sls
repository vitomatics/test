## SLURM core config file for all machines at sifive

slurm:

  # General stuff
  AuthType: munge
  AuthInfo: cred_expire=300
  CryptoType: munge
  MessageTimeout: 120
  KillWait: 120
  BatchStartTimeout: 120
  EioTimeout: 300

  # Execution node
  ProctrackType: linuxproc
  
  # Controller
  SchedulerType: backfill
  SelectType: cons_res
  SelectTypeParameters: CR_CPU_Memory

  JobCompType: none
  # JobCompLoc: /var/log/slurm-llnl/jobcomp.log

  JobAcctGatherType: cgroup

  TrackWCKey: yes

  AccountingStorageType: slurmdbd
  AccountingStoragePort: 6819
  AccountingStorageHost: grid.internal.sifive.com
  AccountingStorageUser: slurm

  # Do not want to restart daemons automatically - this stuff needs
  # to be scheduled.  Except for munge, which breaks installs if false.
  restart:
    munge: true
    node: false
    server: false
    db: false
