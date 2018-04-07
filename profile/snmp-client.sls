# Profile for a machine that is an snmp client

{% set sfimages = 'http://sfimages.internal.sifive.com' %}

states:
  snmp: true
  snmp.mibs: true


snmp:
  mibs:
    sifive/EATON-EPDU-MIB: {{sfimages}}/Eaton/ePDU/EATON-EPDU-MIB.txt
    sifive/EATON-OIDS: {{sfimages}}/Eaton/ePDU/EATON-OIDS.txt
