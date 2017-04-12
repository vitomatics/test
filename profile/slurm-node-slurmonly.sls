## SLURM resource manager execution node machine that only allows
## login to users who are running a SLURM job

include:
  - profile.slurm-node

states:
  slurm.pam: true

pam:
  sshd:
    require_slurm: true
