# pinglog to run at San Mateo

states:
  pinglog: true

pinglog:
  lookup:
    days: 14
  pings:
    sm-border-sifive:
      absent: true
    sm-border-att:
      absent: true
    sm-border-router-3:
      absent: true
    sm-vpn:
      address: 10.100.100.5
    he-vpn:
      address: 10.100.100.6
    sm-border-router03:
      address: 12.246.184.250
    sm-border-attgw:
      address: 12.246.184.249
    he-border-hegw:
      address: 216.218.158.85
    he-border-router11:
      address: 216.218.158.86
    hansolo:
      address: 10.14.0.14
    yoda:
      address: 10.14.16.42
    google:
      address: 8.8.8.8
    ucb:
      address: 128.32.203.137
