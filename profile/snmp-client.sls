# Profile for a machine that is an snmp client

{% set sfimages = 'http://sfimages.internal.sifive.com' %}
{% set junosmibs = sfimages + '/Juniper/JunOS/mibs/juniper-mibs-15.1R6.7/JuniperMibs' %}

states:
  snmp: true
  snmp.mibs: true


snmp:
  mibs:
    - sifive/EATON-OIDS: {{sfimages}}/Eaton/ePDU/EATON-OIDS.txt
    - sifive/EATON-EPDU-MIB: {{sfimages}}/Eaton/ePDU/EATON-EPDU-MIB.txt
    - sifive/EATON-EPDU-MIB: {{sfimages}}/Eaton/ePDU/EATON-EPDU-MIB.txt
    - sifive/JUNIPER-SMI: {{junosmibs}}/mib-jnx-smi.txt
    - sifive/JUNIPER-MIB: {{junosmibs}}/mib-jnx-chassis.txt
