include:
  - default.{{ grains.os_family|lower }}
  - default.secret

states:
  file: true
  timezone: true
  hostname: true
  network: true
  network.resolver: true
  pam.access: true
  pam.sss: true
  pam.mkhomedir: true
  nsswitch: true
  openntpd: true
  ssh.server: true
  ssh.client: true
  sudo: true
  opensmtpd: true

network:
  gateway: 10.14.0.1
  netmask: 255.255.240.0

  resolver:
    search:
      - {{ grains.domain }}
      - sifive.com
    nameservers:
      - 10.14.0.3

timezone: PST8PDT

openntpd:
  servers:
    - 0.us.pool.ntp.org
    - 1.us.pool.ntp.org
    - 2.us.pool.ntp.org
    - 3.us.pool.ntp.org

ldap:
  uri:
    - ldap://ldap.internal.sifive.com
  base: dc=sifive,dc=com
  base_user: ou=people,dc=sifive,dc=com
  base_group: ou=groups,dc=sifive,dc=com
  base_autofs: ou=autofs,dc=sifive,dc=com
  rootdn: cn=root,dc=sifive,dc=com

sssd:
  ldap:
    binddn: cn=sssd,ou=services,dc=sifive,dc=com

autofs:
  ldap:
    binddn: cn=autofs,ou=services,dc=sifive,dc=com

postfix:
  ldap:
    binddn: cn=postfix,ou=services,dc=sifive,dc=com

opensmtpd:
  relay: smtp.internal.sifive.com

krb:
  realm: INTERNAL.SIFIVE.COM
  kdc:
    - kdc0.internal.sifive.com

nss:
  passwd:
    sfadmin:
      uid: 999
      gid: wheel
      home: /
      shell: /bin/sh
      gecos: SiFive
      system: true
  sources:
    passwd:
      - sss
    group:
      - sss

pam:
  access:
    root: LOCAL
    'wheel EXCEPT root': ALL
    sysadmin: ALL

sudo:
  defaults:
    general:
      - env_reset
      - mail_badpass
      - 'secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"'
  userspec:
    - root:
      - ALL: '(ALL:ALL) ALL'
    - '%sysadmin':
      - ALL: '(ALL:ALL) ALL'

sshd:
  options:
    ClientAliveInterval: 300

ssh:
  known_hosts:
    github.com:
      enc: ssh-rsa
      key: AAAAB3NzaC1yc2EAAAABIwAAAQEAq2A7hRGmdnm9tUDbO9IDSwBK6TbQa+PXYPCPy6rbTrTtw7PHkccKrpp0yVhp5HdEIcKr6pLlVDBfOLX9QUsyCOV0wzfjIJNlGEYsdlLJizHhbn2mUjvSAHQqZETYP81eFzLQNnPHt4EVVUh7VfDESU84KezmD5QlWpXLmvU31/yMf+Se8xhHTvKSCZIFImWwoG6mbUoWf9nzpIoaSjB+weqqUUmpaaasXVal72J+UX2B+2RPW3RcT0eOzQgqlJL3RKrTJvdsjE3JEAvGq3lGHSZXy28G3skua2SmVi/w4yCE6gbODqnTWlg7+wC604ydGXA8VJiS5ap43JXiUFFAaQ==
    bitbucket.org:
      enc: ssh-rsa
      key: AAAAB3NzaC1yc2EAAAABIwAAAQEAubiN81eDcafrgMeLzaFPsw2kNvEcqTKl/VqLat/MaB33pZy0y3rJZtnqwR2qOOvbwKZYKiEO1O6VqNEBxKvJJelCq0dTXWT5pbO2gDXC6h6QDXCaHo6pOHGPUy+YBaGQRGuSusMEASYiWunYN0vCAI8QaXnWMXNMdFP3jHAJH0eDsoiGnLPBlBp4TNm6rYI74nMzgz3B9IikW4WVK+dc8KZJZWYjAuORU3jc1c/NPskD2ASinf8v3xnfXeukU0sJ5N6m5E8VLjObPEO+mN2t/FZTMZLiFqPWc/ALSqnMnnhwrNi2rbfg/rd/IpL8Le3pSBne8+seeFVBoGqzHM9yXw==

firewall:
  ports:
    tcp:
      - 22

managedby:
  sh: # Managed by SiFive salt
