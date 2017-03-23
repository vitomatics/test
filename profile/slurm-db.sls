## SLURM resource manager DBD server machines

include:
  - profile.slurm-cluster1
  - profile.slurm-client
  - secret.slurm-db

states:
  slurm.db: true
  policyrc: true

policyrc:
  slurmdbd: false

slurm:
  db:
    DbdHost: localhost
    AuthType: munge
    StorageType: mysql

firewall:
  ports:
    tcp:
      6819: 10.14.0.0/16
