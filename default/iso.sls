# Default setup for an isolated host
# see init.sls for what we are overriding

states:
  pam.sss: false
  openldap.client: false
  sssd: false
  opensmtpd: false
  
  pam: true
  pam.access: true
  pam.pwquality: true
  nsswitch.group: true
  nsswitch.passwd: true
  nsswitch.hosts: true
  nsswitch.shells: true
  firewall.iptables: true
  sfaccount.accounts: true

nss:
  use_sssd: false
  sources:
    passwd:
    group:
    shadow:
    automount:
  passwd:
    sfadmin:
      password: "$6$E0Vn0nac$tGrv1tKOmFZPJQibUqCsCQ92PXTwJmLq3L2zlo/oDtq8/C41LgU.0U68TDN4lfoC8Kat90perMvgOPAf1BtzU"

pkgs:
  list:
    # snapd contacts the outside world - really do not want it
    snapd: false
    # unattended upgrades hang shutdowns
    unattended-upgrades: false

# Need to put public keys in ssh
sfaccount:
  lookup:
    home: /home
    

# nsswitch
#   nsswitch.group
#   nsswitch.passwd
#     nsswitch.group
#   nsswitch.hosts
#   nsswitch.shells
#   sssd

# sssd
#   openldap.client
#   # references to kerberos

# pam

# pam.access
#   pam
#   pam.update

# pam.all
#   pam
#   pam.access
#   pam.sss
#   pam.mkhome

# pam.sss
#   pam
#   sssd

# pam.mkhomedir
#   pam
#   pam.update