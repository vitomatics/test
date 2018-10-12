# Boardtest hosts with an exported NFS directory

{% import_yaml "accounts/allgroups.yml" as allgroups %}


include:
  - profile.nfs-server

file:
  mkdir:
    /export/boardtest:
      user: root
      group: {{ allgroups.groups.compute.gid }}
      mode: '01770'
