# Create the /sifive and /work dirs on isolated machines

file:
  mkdir:
    /sifive:
      user: eda
      group: root
      mode: '0755'
      order: first
    /work:
      user: eda
      group: root
      mode: '0755'
      order: first
