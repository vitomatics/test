## SLURM resource manager execution node machine that only allows
## login to users who are running a SLURM job

include:
  - profile.slurm-node.sls

states:
  slurm.pam: true
