# udev config for a "fpga regression host" which has a single
# FPGA board attached with the boards setup the same for
# Arty or VC707
# See the labhost profile for the setup on development FPGA machines.


states:
  udev: true

# NOTE: Since udevd starts before sssd, it cannot resolve LDAP groups
# during the initial coldplug phase.  Use numerical GIDs instead.
{% set compute_group = salt['group.info']('compute') %}
{% set compute = compute_group.gid|default('compute') %}

# 
udev:
  rules:
    99-sifive-fpga:
      'FPGA management port (FTDI USB)':
        - 'SUBSYSTEM=="usb"'
        - 'ATTRS{idVendor}=="0403"'
        - 'ATTRS{idProduct}=="6010"'
        - 'GROUP="{{ compute }}"'
        - 'MODE="0660"'
      'FPGA serial port (FTDI tty)':
        - 'SUBSYSTEM=="tty"'
        - 'ATTRS{idVendor}=="0403"'
        - 'ATTRS{idProduct}=="6010"'
        - 'GROUP="{{ compute }}"'
        - 'MODE="0660"'
      'FPGA simulated CPU JTAG (Olimex USB)':
        - 'SUBSYSTEM=="usb"'
        - 'ATTRS{idVendor}=="15ba"'
        - 'ATTRS{idProduct}=="002a"'
        - 'GROUP="{{ compute }}"'
        - 'MODE="0660"'
      # A special case of the FPGA serial port that is an arty console
      'Arty console port (FTDI TTY)':
        - 'SUBSYSTEM=="tty"'
        - 'ATTRS{idVendor}=="0403"'
        - 'ATTRS{idProduct}=="6010"'
        - 'ATTRS{product}=="Digilent USB Device"'
        - 'SYMLINK+="tty.sifive-testhost"'
      # Cygnal tty devices are always VC707 consoles
      'VC707 console port (Cygnal TTY)':
        - 'SUBSYSTEM=="tty"'
        - 'ATTRS{idVendor}=="10c4"'
        - 'ATTRS{idProduct}=="ea60"'
        - 'GROUP="{{ compute }}"'
        - 'MODE="0660"'
        - 'SYMLINK+="tty.sifive-testhost"'
