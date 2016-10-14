states:
  udev: true

udev:
  rules:
    99-xilinx:
      'Digilent FT2232C (USB)':
        - 'SUBSYSTEM=="usb"'
        - 'ATTR{idVendor}=="0403"'
        - 'ATTR{manufacturer}=="Digilent"'
        - 'GROUP="compute"'
        - 'MODE="0660"'
      'Digilent FT2232C (TTY)':
        - 'SUBSYSTEM=="tty"'
        - 'ATTRS{idVendor}=="0403"'
        - 'ATTRS{manufacturer}=="Digilent"'
        - 'GROUP="compute"'
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
        - 'GROUP="compute"'
        - 'MODE="0660"'
        - 'SYMLINK+="ttyUSB-vc707"'
      'Olimex ARM-USB-TINY-H':
        - 'SUBSYSTEM=="usb"'
        - 'ATTR{idVendor}=="15ba"'
        - 'ATTR{idProduct}=="002a"'
        - 'GROUP="compute"'
        - 'MODE="0660"'
