# Pillar file for rsync-based backups

sfdump:
  # Keys for rsync dumps
  keys:
    sfdump_hog_key1:
      public: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCjNdQu54ge0ZUkXZIL29ljagxF2JdzOQLqJsDr4TcjbzRRP2e4LSmqPG/TbN1FLJWD0S0NfcF6qKwPkbXtoDSKhLMmSQDGA17Vh6DLY9cKymxBI6uVQ0+QSXht1opGwN+kzx4w+wK+i3ncxDB4xve0LKT8nlm264UltkfPthDEIzWxE1mffs6AnNDM9VopkaVzveFzfq6+pWmXxAqQlas4gto2paCaWMe4uync6UwKbCfTWd+lB/Fc1pQaMMw5gRhDhT8u6E7r7rYXom3obcJkhLtzefnfWMKQlfBkLisVZnlsJZpcZG+fNtnZwtFgSLI6r6F2gpWk5LtNL4S9GOZ5 sfdump_hog_key1
    sfdump_hog_key2:
      public: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDJmtAaqg2GsKxh9YFQ/tXVtdffiOe8WpYuUUuPndQ3YcKLgmMG079LQvzo1RZtSrAzZO/ack6Vjo1cp36Yg0wuUlUoEg+SRfy2al9QJYFOVyEe2lL9b3hKG628CZjcboDC2eQ62kg5Zfa0MHKAut1U3quWKOQjNzN3Y7EhQmSu33Ew9GBBFxDcI1uWrYgaQpOglYYszBgyhuxBnRUAcEr6QlTGiVSEcMjovqtM3vjm6wRKwBV52ugQbK8qExgLLNEKALSu5UBrAqnd5f3libc/oBS/trBnxB96M5W0sw9Y5HGrJ8P0jDW41Dph5x4bH86OlfFmJM3RnpNvvCL9JrpD sfdump_hog_key2
    sfdump_omega1_key1:
      public: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDIrT2qKW6RZuC2Xo/myOw9FMCECBm4OkndcwmAokqQ5XMt0gaJDMHRDD608kkQRx1ibxv9VEUIM4eaX2rG2T0gaqmG/ecy5knmVA8I4/Pd6cig4i2vrDYDDH8xDiOIiVgYZPJ8FblIOw5mZXTiDhFFOGkye4rE1QzAqcGLqBLnBomw5QrSm7c0D1iJk+mJCSzJ4bI7swJFzMF24XURnMtO/BlALmZhd8hNoPLe4PxV6I+aBRyxchCHDWCPHHcq23Co5fnGwD9z2ZNZ2HZ2OZpZVFL5xDsaQJBHDAK06inrHwQQ+HnRAQmUo91Wqi7r0wzMHlfffsflkghvND+Rp1LN davidj@heartofgold.internal.sifive.com
  rsync:
    vulcan-srv:
      client: vulcan.internal.sifive.com
      server: heartofgold.internal.sifive.com
      src: /srv
      dest: /sfbackup/dumps/vulcan-srv
      compression: false
      acls: true
      xattrs: true
      key: sfdump_hog_key1
      days: 3
      weeks: 4
    breencast-ldap-db:
      client: breencast.internal.sifive.com
      server: heartofgold.internal.sifive.com
      src: /var/db/openldap-data
      dest: /sfbackup/dumps/breencast-ldap-db
      compression: false
      acls: false
      xattrs: false
      key: sfdump_hog_key1
      days: 4
      weeks: 2
    breencast-ldap-config:
      client: breencast.internal.sifive.com
      server: heartofgold.internal.sifive.com
      src: /usr/local/etc/openldap
      dest: /sfbackup/dumps/breencast-ldap-config
      compression: false
      acls: false
      xattrs: false
      key: sfdump_hog_key2
      days: 4
      weeks: 2
    dalek-srv-onsite:
      client: dalek.internal.sifive.com
      server: heartofgold.internal.sifive.com
      src: /srv
      dest: /sfbackup/dumps/dalek-srv
      compression: false
      acls: false
      xattrs: false
      key: sfdump_hog_key1
      days: 4
      weeks: 2
    dalek-srv-offsite:
      client: dalek.internal.sifive.com
      server: omega1.internal.sifive.com
      src: /srv
      dest: /sfbackup/dumps/dalek-srv
      compression: false
      acls: false
      xattrs: false
      key: sfdump_omega1_key1
      days: 4
      weeks: 2
    grid-srv-onsite:
      client: grid.internal.sifive.com
      server: heartofgold.internal.sifive.com
      src: /srv
      dest: /sfbackup/dumps/grid-srv
      compression: false
      acls: false
      xattrs: false
      key: sfdump_hog_key1
      days: 4
      weeks: 2
    yoda-srv-onsite:
      client: yoda.internal.sifive.com
      server: heartofgold.internal.sifive.com
      src: /srv
      dest: /sfbackup/dumps/yoda-srv
      compression: false
      acls: false
      xattrs: false
      key: sfdump_hog_key1
      days: 2
      weeks: 8
    yoda-srv-offsite:
      client: yoda.internal.sifive.com
      server: omega1.internal.sifive.com
      src: /srv
      dest: /sfbackup/dumps/yoda-srv
      compression: false
      acls: false
      xattrs: false
      key: sfdump_omega1_key1
      days: 2
      weeks: 8
    vader-srv-onsite:
      client: vader.internal.sifive.com
      server: heartofgold.internal.sifive.com
      src: /srv
      dest: /sfbackup/dumps/vader-srv
      compression: false
      acls: false
      xattrs: false
      key: sfdump_hog_key1
      days: 2
      weeks: 8
    vader-srv-offsite:
      client: vader.internal.sifive.com
      server: omega1.internal.sifive.com
      src: /srv
      dest: /sfbackup/dumps/vader-srv
      compression: false
      acls: false
      xattrs: false
      key: sfdump_omega1_key1
      days: 2
      weeks: 8
    lambda00-work-onsite:
      client: lambda00.internal.sifive.com
      server: heartofgold.internal.sifive.com
      src: /work
      dest: /sfbackup/dumps/lambda00-work
      compression: false
      acls: true
      xattrs: true
      key: sfdump_hog_key1
      days: 2
      weeks: 8
