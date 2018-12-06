## SLURM resource manager execution node machine

states:
  slurm.node: true
  slurm.client: true
  policyrc: true
  sysctl: true

policyrc:
  slurmd: false

sysctl:
  params:
    # Recommended for high-throughput slurm
    net.core.somaxconn: 1024

firewall:
  ports:
    tcp:
      6818: 10.14.0.0/16
