# Boardtest hosts with an exported NFS directory

{% import_yaml "accounts/allgroups.yml" as allgroups %}

{# The below list of subnets should be a space-separated list #}
{% set boardtest_subnets = "10.16.0.0/16" %}

{% set mountd_port = "2050" %}
{% set nlockmgr_port = "2051" %}

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
  lookup:
    mountd_port: {{ mountd_port|yaml_dquote }}
  server:
    exports:
      boardtest:
        path: /srv/boardtest/nfs
        clients:
{% for subnet in boardtest_subnets.split() %}
          {{ subnet }}:
            - rw
            - root_squash
{% endfor %}

sysctl:
  params:
    # netlckmgr port reassignement
    # Ref https://www.peterbeard.co/blog/post/setting-up-iptables-for-nfs-on-ubuntu/
    fs.nfs.nlm_tcpport: {{ nlockmgr_port|yaml_dquote }}
    fs.nfs.nlm_udpport: {{ nlockmgr_port|yaml_dquote }}

    
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
