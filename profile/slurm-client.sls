## SLURM resource manager clientmachines

include:
  - secret.munge

states:
  slurm.client: true

# Note slurm:MungeKey64 is in a secret file
slurm:
  ClusterName: sifive_compute
  ControlMachine: sandbox
  ControlAddr: sandbox.internal.sifive.com
  AccountingStorageHost: sandbox.internal.sifive.com
  AccountingStorageUser: slurm
  
