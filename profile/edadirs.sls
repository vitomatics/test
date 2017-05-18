# Create the /sifive and /work dirs on isolated machines
# Note we use root as other users might not exist

file:
  mkdir:
    /sifive:
      user: root
      group: root
      mode: '0755'
      order: first
    /work:
      user: root
      group: root
      mode: '0755'
      order: first
