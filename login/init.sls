include:
  - compute

sshd:
  options:
    PasswordAuthentication: no
    X11Forwarding: yes

pam:
  access:
    compute: ALL EXCEPT LOCAL
    consult: ALL EXCEPT LOCAL
