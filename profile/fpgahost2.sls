# udev config for an "fpga regression host" which has a single
# FPGA board attached with the boards setup the same for
# Arty or VC707 or MicroSemi
# See the labhost profile for the setup on development FPGA machines.


states:
  sffpga: true

# NOTE: Since udevd starts before sssd, it cannot resolve LDAP groups
# during the initial coldplug phase.  Use numerical GIDs instead.
{% set compute_group = salt['group.info']('compute') %}
{% set compute = compute_group.gid|default('compute') %}

sffpga:
  lookup:
    devgroup: {{ compute }}
    devmode: '0660'
    devorder: '99'
