## SLURM resource manager controller machine(s)
## Note the config file is shared and most of the stuff is in slurm-common

include:
  - secret.slurm-db

states:
  slurm.server: true
  slurm.client: true
  policyrc: true
  sysctl: true

policyrc:
  slurmctld: false

sysctl:
  params:
    # Recommended for high-throughput slurm
    net.core.somaxconn: 1024

firewall:
  ports:
    tcp:
      6817: 10.14.0.0/16



