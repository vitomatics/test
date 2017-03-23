## SLURM resource manager execution node machines

include:
  - profile.slurm-cluster1
  - profile.slurm-client

states:
  slurm.node: true
  policyrc: true

policyrc:
  slurmd: false

firewall:
  ports:
    tcp:
      6817: 10.14.0.0/16
