# Pillar file for rhtest

states:
  sfaccount.accounts: true

# Need to put public keys in for ssh
sfaccount:
  lookup:
    home: /home
  # We host our own home directories
  servers:
    {{grains.id}}: true

