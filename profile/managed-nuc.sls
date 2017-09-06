## profile for an AMT-managed NUC

# No serial console, text-mode console:
boot:
  grub:
    kargs: text nomodeset xforcevesa
    serial:

