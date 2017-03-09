## SLURM resource manager clientmachines

include:
  - secret.munge

states:
  slurm: true

# Note slurm:MungeKey64 is in a secret file
slurm:
  ClusterName: sifive_compute
  ControlMachine: grid
  ControlAddr: grid.internal.sifive.com
  AccountingStorageHost: grid.internal.sifive.com
  AccountingStorageUser: slurm
  
