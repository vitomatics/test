# Profile for the host that is the master for syncing the eda
# tools required by SmartDV contractors

include:
  - profile.edasync-smartdv
  - secret.edasync-smartdv-key

states:
  sfpushdirs.master: true