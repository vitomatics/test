## SLURM resource manager clientmachines

include:
  - profile.slurm-client

states:
  slurm.node: true
  policyrc: true

policyrc:
  slurmd: false

slurm:
  ProctrackType: linuxproc
  nodes:
    sandbox:
      CPUs: 2
      RealMemory: 4096
    gamma[00-07]:
      CPUs: 32
      RealMemory: 125000
      Feature: gamma
  partitions:
    compute1:
      Default: yes
      nodes:
        - 'gamma[00-07]'
    test:
      nodes:
        - sandbox
