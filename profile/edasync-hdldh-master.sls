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
      - /sifive/tools/verilator
      - /sifive/tools/cadence/xcelium/18.09.004
      - /sifive/tools/sifive/wake
      - /sifive/tools/sifive/wit
      - /sifive/tools/perl/perl
      - /sifive/tools/python/python/3.7.0
      - /sifive/tools/gcc/7.2.0
      - /sifive/tools/gcc/4.9.4
      - /sifive/tools/clang/clang+llvm-5.0.1-x86_64-linux-gnu-ubuntu-16.04
      - /sifive/tools/clang/clang+llvm-7.0.0-x86_64-linux-gnu-ubuntu-16.04
      - /sifive/tools/node/11.4.0
      - /work/tools/riscv-tools/b266e97760fbe57feee534941f890d0cde14245a
      - /work/tools/riscv-tools/d4f3490ed2bb54bcc7be7b2a11f764cafce579fb
      - /work/tools/riscv-tools/667215167f1ad358f882979204db55b2a0d928af
      - /sifive/sip/plda/pcie/20190122
      - /sifive/sip/plda/pcie/20190211
