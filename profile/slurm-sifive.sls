## SLURM core config file for all machines at sifive

slurm:

  # General stuff
  AuthType: munge
  CryptoType: munge

  # Execution node
  ProctrackType: linuxproc

  # Controller
  SchedulerType: backfill
  SelectType: cons_res
  SelectTypeParameters: CR_CPU_Memory

  JobCompType: filetxt
  JobCompLoc: /var/log/slurm-llnl/jobcomp.log

  JobAcctGatherType: cgroup

  AccountingStorageType: slurmdbd
  AccountingStoragePort: 6819
  AccountingStorageHost: grid.internal.sifive.com
  AccountingStorageUser: slurm

  # Do not want to restart daemons automatically - this stuff needs
  # to be scheduled
  restart:
    munge: false
    node: true
    server: false
    db: false
