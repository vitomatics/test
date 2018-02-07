## SLURM resource manager DBD server machines

include:
  - profile.slurm-cluster1
  - secret.slurm-db

states:
  slurm.db: true
  slurm.client: true
  policyrc: true

policyrc:
  slurmdbd: false

slurm:
  db:
    DbdHost: localhost
    AuthType: munge
    StorageType: mysql
    PurgeStepAfter: 1
    PurgeJobAfter: 2

firewall:
  ports:
    tcp:
      6819: 10.14.0.0/16
