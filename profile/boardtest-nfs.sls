# Boardtest hosts with an exported NFS directory

{% import_yaml "accounts/allgroups.yml" as allgroups %}

{# The below list of subnets should be a space-separated list #}
{% set boardteset_subnets = '10.16.0.0/16' %}

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
{% for subnet in boadtest_subnets.split() %}
          {{ subnet }}:
            - rw
            - root_squash
{% endfor %}

{% set mountd_port = '2050' %}
{% set nlockmgr_port = '2051' %}

sysctl:
  params:
    # netlckmgr port reassignement
    # Ref https://www.peterbeard.co/blog/post/setting-up-iptables-for-nfs-on-ubuntu/
    fs.nfs.nlm_tcpport: {{ nlockmgr_port }}
    fs.nfs.nlm_udpport: {{ nlockmgr_port }}

nfs4:
  lookup:
    mountd_port: {{ mountd_port }}
    
firewall:
  ports:
    tcp:
      111: {{ boardtest_subnets }}
      2049: {{ boardtest_subnets }}
      {{ mountd_port }}: {{ boardtest_subnets }}
      {{ nlockmgr_port }}: {{ boardtest_subnets }}
    udp:
      111: {{ boardtest_subnets }}
      2049: {{ boardtest_subnets }}
      {{ mountd_port }}: {{ boardtest_subnets }}
      {{ nlockmgr_port }}: {{ boardtest_subnets }}
