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

  SlurmctldPort: '6817'
  SlurmdPort: '6818'
  AuthType: munge
  CryptoType: munge
  

pkgs:
  llist:
    libslurmdb-dev: true
    libslurm-dev: true
    libslrum-perl: true
