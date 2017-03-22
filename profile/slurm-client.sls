## SLURM resource manager clientmachines

include:
  - secret.munge

states:
  slurm.client: true
  slurm.devel: true

# Note slurm:MungeKey64 is in a secret file
slurm:
  ClusterName: cluster1
  ControlMachine: sandbox
  ControlAddr: sandbox.internal.sifive.com

  SlurmctldPort: '6817'
  SlurmdPort: '6818'
  AuthType: munge
  CryptoType: munge
  

