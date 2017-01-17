## Generic setup for a SiFive apache web server.
## Uses the standard salt apache formula.

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
