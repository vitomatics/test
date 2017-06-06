# Create the /sifive and /work dirs on isolated machines form smartdv

file:
  mkdir:
    /sifive:
      user: eda
      group: root
      mode: '0755'
      order: first
    /work:
      user: eda
      group: sdv-users
      mode: '0775'
      order: first
