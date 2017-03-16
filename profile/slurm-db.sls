## SLURM resource manager DBD server

include:
  - profile.slurm-client

states:
  slurm.db: true

policyrc:
  slurmdbd: false

slurm:
  db:
    DbdHost: localhost
    AuthType: munge
    StorageType: mysql
    StorageHost: localhost
    StorageUser: slurm
    StoragePass: asdf1234
    StorageLoc: slurm_acct_db
    DebugLevel: debug5

pkgs:
  list:
    libslurmdb-perl: true
    
