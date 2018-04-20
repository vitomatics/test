## SLURM resource manager client machines
## Note the config file is shared and most of the stuff is in slurm-common

include:
  - profile.slurm-cluster1

states:
  slurm.client: true
  slurm.devel: true
  slurm.openlava: true
  sysctl: true

sysctl:
  params:
    # Recommended for high-throughput slurm
    net.core.somaxconn: 1024

firewall:
  ports:
    tcp:
      '6820:9819': 10.14.0.0/16

