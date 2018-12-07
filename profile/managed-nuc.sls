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
  services:
    sifive-managed-nuc:
      - 623/udp
      - 623/tcp
      - 664/udp
      - 664/tcp
      - 5900/udp
      - 5900/tcp
      - 16992/udp
      - 16992/tcp
      - 16993/udp
      - 16993/tcp
      - 16994/udp
      - 16994/tcp
      - 16995/udp
      - 16995/tcp
    
