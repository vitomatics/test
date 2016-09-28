# network:
#   interfaces:
#     eth2:
#       ip: 10.14.1.7

# boot:
#   grub:
#     serial:
#       port: 1

sshd:
  options:
    PasswordAuthentication: no
    X11Forwarding: yes

pam:
  access:
    compute: ALL EXCEPT LOCAL
    consult: ALL EXCEPT LOCAL
