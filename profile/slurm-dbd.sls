## SLURM resource manager DBD server

include:
  - profile.slurm-client

states:
  slurm.slurmdbd: true

slurmdbd:
  AuthType: munge
  StorageUser: slurm
  StoragePass: asdf1234

