states:
  udev: true

# NOTE: Since udevd starts before sssd, it cannot resolve LDAP groups
# during the initial coldplug phase.  Use numerical GIDs instead.
{% set compute = salt['group.info']('compute') %}
{% set compute = compute.gid|default('compute') %}

udev:
  rules:
    99-xilinx:
      'FT2232C/FT2232H (USB)':
        - 'SUBSYSTEM=="usb"'
        - 'ATTR{idVendor}=="0403"'
        - 'ATTR{idProduct}=="6010"'
        - 'GROUP="{{ compute }}"'
        - 'MODE="0660"'
      'FT2232C/FT2232H (TTY)':
        - 'SUBSYSTEM=="tty"'
        - 'ATTRS{idVendor}=="0403"'
        - 'ATTRS{idProduct}=="6010"'
        - 'GROUP="{{ compute }}"'
        - 'MODE="0660"'
      'Arty':
        - 'SUBSYSTEM=="tty"'
        - 'ATTRS{idVendor}=="0403"'
        - 'ATTRS{serial}=="210319789439"'
        - 'SYMLINK+="ttyUSB-arty"'
      'VC707':
        - 'SUBSYSTEM=="tty"'
        - 'ATTRS{idVendor}=="10c4"'
        - 'ATTRS{idProduct}=="ea60"' # non-unique ATTRS{serial}
        - 'GROUP="{{ compute }}"'
        - 'MODE="0660"'
        - 'SYMLINK+="ttyUSB-vc707"'
      'Olimex ARM-USB-TINY-H':
        - 'SUBSYSTEM=="usb"'
        - 'ATTR{idVendor}=="15ba"'
        - 'ATTR{idProduct}=="002a"'
        - 'GROUP="{{ compute }}"'
        - 'MODE="0660"'
