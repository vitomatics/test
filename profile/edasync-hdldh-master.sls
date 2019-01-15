# Profile for the host that is the master for syncing the eda
# tools required by HDL Design House contractors

include:
  - secret.edasync-hdldh-key

states:
  sfpushdirs.master: true

# Directories to sync for HDL Design House contractors

sfpushdirs:
  eda-hdldh:
    user: eda
    slave: lambda00.internal.sifive.com
    dirs:
      - /sifive/tools/Modules
      - /sifive/tools/synopsys/scl
      - /sifive/tools/synopsys/vcs
      - /sifive/tools/sifive/wake
      - /sifive/tools/sifive/wit
      - /sifive/tools/verilator
