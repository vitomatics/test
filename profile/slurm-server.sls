## SLURM resource manager controller machine(s)
## Note the config file is shared and most of the stuff is in slurm-common

include:
  - profile.slurm-cluster1
  - secret.slurm-db

states:
  slurm.server: true
  slurm.client: true
  policyrc: true

policyrc:
  slurmctld: false

firewall:
  ports:
    tcp:
      6817: 10.14.0.0/16



