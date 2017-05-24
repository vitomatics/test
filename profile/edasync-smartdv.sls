# Directories to sync for SmartDV contractors

sfpushdirs:
  eda-smartdv:
    user: eda
    master: tardis.internal.sifive.com
    masterkey_pillar: keys:eda:smartdv:private
    slave: lambda00.internal.sifive.com
    slavekey_pillar: keys:eda:smartdv:public
    dirs:
      - /sifive/tools/Modules 
      - /sifive/tools/vcs
      - /sifive/ip/tsmc/cln28hpc/synopsys/MP-12G-PHY_TSMC_28HPC_x8
      - /sifive/ip/tsmc/cln28hpc/cadence/ddr-20161101