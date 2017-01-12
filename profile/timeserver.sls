# Pillar config for SiFive time server.

states:
  chrony: true

chrony:
  allow:
    - 10.0.0.0/16
  servers:
    - clock.fmt.he.net  # Fremont
    - clock.sjc.he.net  # San Jose
    - time.nist.gov     # Boulder
    - nist1.datum.com   # San Jose
    - timekeeper.isi.edu # LA area
