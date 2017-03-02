## Ganglia profile for a monitoring server

states:
  ganglia.gmetad: true

ganglia:
  gmetad:
    debug_level: 0
    gridname: SiFive
    authority: http://ganglia.internal.sifive.com
    trusted_hosts:
      - 127.0.0.1
    umask: '022'
    xml_port: 8651
    interactive_port: 8652
    server_threads: 4
#    carbon_server: carbon.example.com
#    carbon_port: 2003
#    carbon_protocol: udp
#    graphite_path: 'datacenter1.gmetad.%s.%h.%m'
    data_sources:
      "SiFive Cluster":
        interval: 10
        hosts:
          - sandbox.internal.sifive.com:8649

firewall:
  ports:
    tcp:
      8649: 10.0.0.0/8
    udp:
      8649: 10.0.0.0/8

