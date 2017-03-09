## SLURM resource manager clientmachines

include:
  - profile.slurm-client

states:
  slurm.server: true

slurm:
  AccountingStorageLoc: /var/log/slurm-llnl/slurm-account.log

