# Boardtest hosts with an exported NFS directory

{% import_yaml "accounts/allgroups.yml" as allgroups %}


include:
  - profile.nfs-server
  - profile.boardtest-host

file:
  mkdir:
    /srv/boardtest/nfs:
      user: root
      group: {{ allgroups.groups.compute.gid }}
      mode: '01770'
    /srv/boardtest/tftpboot:
      user: root
      group: {{ allgroups.groups.compute.gid }}
      mode: '01770'


nfs4:
  server:
    exports:
      boardtest:
        path: /srv/boardtest/nfs
        clients:
          10.14.0.0/16:
            - rw
            - root_squash
