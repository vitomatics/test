## Test ganglia profile

states:
  ganglia.monitor: true
  ganglia.gmetad: true

ganglia:
  debug_level: 0
  cluster_name: sifive
  cluster_owner: help@sifive.com

  host_location: HE

  udp_send_channels:
    chan1:
      mcast_join: 239.2.11.71
      port: 8649
      ttl: 1
  udp_recv_channels:
    chan1:
      mcast_join: 239.2.11.71
      bind: 239.2.11.71
      port: 8649
  tcp_accept_channels:
    chan2:
      port: 8649
  
  gmetad:
    debug_level: 0
    gridname: example grid
    authority: http://grid.example.com
    trusted_hosts:
      - 1.2.3.4
    umask: '022'
    xml_port: 8651
    interactive_port: 8652
    server_threads: 10
    carbon_server: carbon.example.com
    carbon_port: 2003
    carbon_protocol: udp
    graphite_path: '"datacenter1.gmetad.%s.%h.%m"'
    data_sources:
      "sifive cluster":
        interval: 10
        hosts:
          - logger.example.com:8649
          - logger2.example.com:8650
