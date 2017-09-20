# udev config for a "fpga regression host" which has a single
# FPGA board attached with the boards setup the same for
# Arty or VC707
# See the labhost profile for the setup on development FPGA machines.


states:
  udev: true
  sffpga: true

# NOTE: Since udevd starts before sssd, it cannot resolve LDAP groups
# during the initial coldplug phase.  Use numerical GIDs instead.
{% set compute_group = salt['group.info']('compute') %}
{% set compute = compute_group.gid|default('compute') %}

# 
udev:
  rules:
    99-sifive-fpga:
      'FTDI JTAG port (USB)':
        - 'SUBSYSTEM=="usb"'
        - 'ATTRS{idVendor}=="0403"'
        - 'ATTRS{idProduct}=="6010"'
        - 'GROUP="{{ compute }}"'
        - 'MODE="0660"'
      'FTDI serial port (tty)':
        - 'SUBSYSTEM=="tty"'
        - 'ATTRS{idVendor}=="0403"'
        - 'ATTRS{idProduct}=="6010"'
        - 'GROUP="{{ compute }}"'
        - 'MODE="0660"'
      'Olimex JTAG (USB)':
        - 'SUBSYSTEM=="usb"'
        - 'ATTRS{idVendor}=="15ba"'
        - 'ATTRS{idProduct}=="002a"'
        - 'GROUP="{{ compute }}"'
        - 'MODE="0660"'
      'VC707 console port (Cygnal tty)':
        - 'SUBSYSTEM=="tty"'
        - 'ATTRS{idVendor}=="10c4"'
        - 'ATTRS{idProduct}=="ea60"'
        - 'GROUP="{{ compute }}"'
        - 'MODE="0660"'

