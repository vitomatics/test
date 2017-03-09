## SLURM resource manager clientmachines

include:
  - secret.munge
  - profile.slurm-client

states:
  slurm.node: true

# Note slurm:MungeKey64 is in a secret file
slurm:
  nodes:
    sandbox:
      CPUs: 2
      RealMemory: 4
      Sockets: 1
      CoresPerSocket: 1
      ThreadsPerCore: 2
  partitions:
    test:
      nodes:
        - sandbox
