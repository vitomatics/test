## SLURM resource manager clientmachines

include:
  - profile.slurm-client

states:
  slurm.node: true

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
      Default: yes
      nodes:
        - sandbox
