# SiFive Pillar setup for the salt master.

sfsalt:
  lookup:
    sfsalt.lookup.saltdir: /srv/salt
    sfsalt.lookup.pillardir: /srv/pillar
    sfsalt.lookup.formulardir: /srv/formulas

formulas:
  apache-formula: true

nodegroups:
  login:
    algol: true
    altair: true

#   formulas:
#     formulaname: true
#   nodegroups:
#     groupname:
#       host1: true
#       host2: true



