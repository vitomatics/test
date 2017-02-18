# Pillar config to speciey home dirs for sifive with authorized keys.
# This lists all users but typically only one homedir is created with
# username passed as pillar 'homedirs.user' variable.

states:
  homedirs: true
  
include:
  - homedirs.homedirs
