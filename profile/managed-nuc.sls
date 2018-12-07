## profile for an AMT-managed NUC

states:
  portreserve: true

# No serial console, text-mode console:
boot:
  grub:
    kargs: text nomodeset xforcevesa
    serial:

# Reserve the AMT ports so no one else tries to use them
portreserve:
  sifive-managed-nuc:
    - 623
    - 664
    - 5900
    - 16992
    - 16993
    - 16994
    - 16995
    
