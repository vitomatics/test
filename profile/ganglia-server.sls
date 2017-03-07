## Ganglia profile for a monitoring server
## This explicitly monitors the sifive_compute multicast cluster
## and the sifive_server unicaster cluster

states:
  ganglia.gmetad: true
  ganglia.monitor: true

file:
  mkdir:
    /srv/ganglia:
      user: ganglia
      group: ganglia
      mode: '0755'

ganglia:

  lookup:
    user: ganglia

  ## First the gmond for the server monitoring
  debug_level: 0
  cluster_name: sifive_server
  cluster_owner: help@sifive.com
  host_location: HE and SF

  udp_recv_channels:
    receiving_channel:
      port: 8650
  tcp_accept_channels:
    data_channel:
      port: 8650

  ## Now the gmetad for both server and compute monitoring
  gmetad:
    debug_level: 0
    gridname: SiFive
    authority: http://gweb.internal.sifive.com
    trusted_hosts:
      - 127.0.0.1
    umask: '022'
    rrd_rootdir: /srv/ganglia/rrds
    xml_port: 8651
    interactive_port: 8652
    server_threads: 4
#    carbon_server: carbon.example.com
#    carbon_port: 2003
#    carbon_protocol: udp
#    graphite_path: 'datacenter1.gmetad.%s.%h.%m'
    data_sources:
      sifive_compute:
        interval: 10
        hosts:
          - gamma00.internal.sifive.com:8649
          - gamma05.internal.sifive.com:8649
      sifive_server:
        interval: 10
        hosts:
          - gmon0.internal.sifive.com:8650
          - gmon1.internal.sifive.com:8650

firewall:
  ports:
    udp:
      8649: 10.14.0.0/16
      8650: 10.14.0.0/16
    tcp:
      8649: 10.14.16.75 10.14.16.76
      8650: 10.14.16.75 10.14.16.76
