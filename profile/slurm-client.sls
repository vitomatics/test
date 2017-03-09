## SLURM resource manager clientmachines

states:
  slurm: true

# Note slurm:MungeKey64 is in a secret file
slurm:
  ClusterName: sifive_compute
  ControlMachine: grid
  ControlAddr: grid
