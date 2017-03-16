## SLURM resource manager clientmachines

include:
  - profile.slurm-client

states:
  slurm.server: true

policyrc:
  slurmctld: false

slurm:
  SchedulerType: backfill
  SelectType: cons_res
  SelectTypeParameters: CR_CPU_Memory
  DefMemPerCPU: 2000

  JobCompType: filetxt
  JobCompLoc: /var/log/slurm-llnl/jobcomp.log

  JobAcctGatherType: cgroup
  AccountingStorageLoc: /var/log/slurm-llnl/accounting.dat

  AccountingStorageHost: sandbox.internal.sifive.com
  AccountingStorageUser: slurm


