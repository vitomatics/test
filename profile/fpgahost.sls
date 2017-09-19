# udev config for a "fpga>host" which can have multiple
# FPGA boards attached with the boards IDd on the basis of board type
# See the fpgahost profile for the setup on FPGA machines.


states:
  udev: true

# NOTE: Since udevd starts before sssd, it cannot resolve LDAP groups
# during the initial coldplug phase.  Use numerical GIDs instead.
{% set compute_group = salt['group.info']('compute') %}
{% set compute = compute_group.gid|default('compute') %}

udev:
  rules:
    99-sifive-fpga:
      'FPGA programming/control port (FTDI)':
        - 'SUBSYSTEM=="tty"'
        - 'ATTRS{idVendor}=="0403"'
        - 'ATTRS{idProduct}=="6010"'
        - 'GROUP="{{ compute }}"'
        - 'MODE="0660"'
        - 'SYMLINK+="ttyFPGA"'
      'FPGA simulated CPU console (Cygnal)':
        - 'SUBSYSTEM=="tty"'
        - 'ATTRS{idVendor}=="10c4"'
        - 'ATTRS(idProduct}=="ea60"'
        - 'GROUP="{{ compute }}"'
        - 'MODE="0660"'
        - 'SYMLINK+="ttyTESTCON"'
      'FPGA simulated CPU JTAG (Olimex)':
        - 'SUBSYSTEM=="tty"'
        - 'ATTRS{idVendor}=="15ba"'
        - 'ATTRS(idProduct}=="002a"'
        - 'GROUP="{{ compute }}"'
        - 'MODE="0660"'
        - 'SYMLINK+="ttyTESTJTAG"'
