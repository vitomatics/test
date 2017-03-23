## SLURM resource manager execution node machines

include:
  - profile.slurm-cluster1

states:
  slurm.node: true
  slurm.client: true
  policyrc: true

policyrc:
  slurmd: false

firewall:
  ports:
    tcp:
      6818: 10.14.0.0/16
