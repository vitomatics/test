# Pillar config for SiFive time server.

states:
  chrony: true

chrony:
  lookup:
    rtcsync: true
  allow:
    - 10.14.0.0/16
    - 10.15.0.0/16
    - 10.17.0.0/16
    - 10.100.0.0/16
    - 10.101.0.0/16
  server:
    - clock.fmt.he.net  # Fremont
    - clock.sjc.he.net  # San Jose
    - time.nist.gov     # Boulder
    - timekeeper.isi.edu # LA area

firewall:
  ports:
    udp:
      123: 10.0.0.0/8
