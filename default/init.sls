# Default pillar values for all hosts, Ubuntu, Debian and FreeBSD
# Note that some of these are overridden for "isolated" hosts -
# check with iso.sls before making substantial changes.

include:
  - default.{{ grains.os_family|lower }}
  - secret.default


states:
  file: true
  hostname: true
  timezone: true
  sudo: true
  kerberos.client: true
  pam.access: true
  pam.sss: true
  pam.pwquality: true
  pam.mkhomedir: true
  nsswitch: true
  ssh.server: true
  ssh.client: true
  opensmtpd: true
  sfsalt.minion: true
  sfsalt.minion.pingcheck: true


network:
  resolver:
    search:
      - internal.sifive.com
      - sifive.com

timezone:
  zone: PST8PDT

chrony:
  lookup:
    rtcsync: true
    default_server:
      - 0.debian.pool.ntp.org
      - 1.centos.pool.ntp.org
      - 2.ubuntu.pool.ntp.org
      - 3.freebsd.pool.ntp.org
    log: tracking measurements statistics
    logchange: '0.5'
    {# Servers for client machines are defined in the static-subnet files #}


ldap:
  uri:
    - ldap://ldap2.internal.sifive.com
  base: dc=sifive,dc=com
  base_user: ou=people,dc=sifive,dc=com
  base_group: ou=groups,dc=sifive,dc=com
  base_autofs: ou=autofs,dc=sifive,dc=com
  rootdn: cn=root,dc=sifive,dc=com

sssd:
  ldap:
    binddn: cn=sssd,ou=services,dc=sifive,dc=com
  kerberos:
    realm: INTERNAL.SIFIVE.COM
    kdc:
      - vader.internal.sifive.com

kerberos:
  client:
    libdefaults:
      default_realm: INTERNAL.SIFIVE.COM
      dns_lookup_kdc: 'false'
      forwardable: 'true'
      proxiable: 'true'
    realms:
      INTERNAL.SIFIVE.COM:
        kdc: [ vader.internal.sifive.com ]
        admin_server: vader.internal.sifive.com

autofs:
  lookup:
    timeout: 14400
  ldap:
    binddn: cn=autofs,ou=services,dc=sifive,dc=com

postfix:
  ldap:
    binddn: cn=postfix,ou=services,dc=sifive,dc=com

opensmtpd:
  relay: smtp.internal.sifive.com

nss:
  use_sssd: true
  passwd:
    sfadmin:
      gid: wheel
      home: /
      shell: /bin/sh
      gecos: SiFive
      system: true
      # passwd is in the secret subdir
  sources:
    passwd:
      - sss
    group:
      - sss
    shadow:
      - sss

pam:
  access:
    root: LOCAL
    sfadmin: 10.0.0.0/8
    sysadmin: ALL
  pwquality:
    difok: 2
    minclass: 3
    maxrepeat: 3
    maxsequence: 3
    minlen: 11

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



managedby:
  sh: "#               *** Managed by SiFive salt ***"
  c: "              /*** Managed by SiFive salt ***/"


sfsalt:
  minion:
    master:
      - salt0.internal.sifive.com
      - salt1.internal.sifive.com
    master_type: 'failover'
    master_shuffle: 'false'
    # This is longer than a VM reboot
    master_alive_interval: '60'
    master_failback: 'true'
    master_failback_interval: '60'
    retry_dns: '0'
    hash_type: 'sha256'
    confname: 99-sfsalt.conf
    clearconf:
      - minion.d/99-sfpreseed.conf
      - minion.d/99-master-host.conf
      - minion.d/99-hash-type.conf
      - minion.d/beacons.conf
      - minion.d/engine.conf
      - minion.d/reactor.conf
      - minond.d/f_defaults.conf


