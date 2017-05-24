# Profile for the host that is the master for syncing the eda
# tools required by SmartDV contractors

include:
  - secret.edasync-smartdv-key

states:
  sfpushdirs.master: true

# Directories to sync for SmartDV contractors

sfpushdirs:
  eda-smartdv:
    user: eda
    slave: lambda00.internal.sifive.com
    dirs:
      - /sifive/tools/Modules 
      - /sifive/tools/synopsys/vcs
      - /sifive/vip/smartdv
      - /sifive/ip/tsmc/cln28hpc/synopsys/MP-12G-PHY_TSMC_28HPC_x8
      - /sifive/ip/tsmc/cln28hpc/cadence/ddr-20161110
      - /sifive/ip/tsmc/cln28hpc/cadence/ddr-20161110