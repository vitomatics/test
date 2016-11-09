# Pillar config to create home dirs for sifive with authorized keys
# Needs to be run after first reboot due to dependce on users (and,
# on the way, nsswitch)

include:
  - homedirs.homedirs

latestates:
  homedirs: true

