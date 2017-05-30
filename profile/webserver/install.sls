## Generic setup for a SiFive apache web server for machine access
## for e.g. installs and patching.
## Uses the standard salt apache formula.
## Slightly different ACLs

states:
  apache: true
  apache.config: true
  apache.no_default_vhost: true

apache:
  lookup:
    version: '2.4'
    
  name_virtual_hosts:
    - interface: '*'
      port: 80
    - interface: '*'
      port: 443
  ServerAdmin: help@sifive.com

firewall:
  ports:
    tcp:
      80: 10.14.0.0/16 10.15.0.0/16 10.134.0.0/16
      443: 10.14.0.0/16 10.15.0.0/16 10.134.0.0/16
