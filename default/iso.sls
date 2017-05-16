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

nss:
  use_sssd: false
  sources:
    passwd:
    group:
    shadow:
    automount:

pkgs:
  list:
    # snapd contacts the outside world - really do not want it
    snapd: false
    # unattended upgrades hang shutdowns
    unattended-upgrades: false

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