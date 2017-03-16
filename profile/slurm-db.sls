## SLURM resource manager DBD server

include:
  - profile.slurm-client
  - secret.slurm-db

states:
  slurm.db: true

policyrc:
  slurmdbd: false

slurm:
  db:
    DbdHost: localhost
    AuthType: munge
    StorageType: mysql
