# Pillar config for SiFive time server.

states:
  chrony: true

chrony:
  lookup:
    rtcsync: true
  allow:
    - 10.0.0.0/16
  server:
    - clock.fmt.he.net  # Fremont
    - clock.sjc.he.net  # San Jose
    - time.nist.gov     # Boulder
    - timekeeper.isi.edu # LA area
