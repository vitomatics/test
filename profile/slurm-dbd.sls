## SLURM resource manager DBD server

include:
  - profile.slurm-client

states:
  slurm.slurmdbd: true

policyrc:
  slurmdbd: false

slurmdbd:
  AuthType: munge
  StorageUser: slurm
  StoragePass: asdf1234

pkgs:
  list:
    libslurmdb-perl: true
    
