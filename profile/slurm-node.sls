## SLURM resource manager clientmachines

include:
  - profile.slurm-client

states:
  slurm.node: true

policyrc:
  slurmd: false

slurm:
  ProctrackType: linuxproc
  nodes:
    sandbox:
      CPUs: 2
      RealMemory: 4096
      Sockets: 1
      CoresPerSocket: 1
      ThreadsPerCore: 2
  partitions:
    test:
      Default: yes
      nodes:
        - sandbox
