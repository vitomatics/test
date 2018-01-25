## pillar file for gravelpit

# network - dhcp

states:
  firewall.iptables: true
  sftesthost: true
  rsyslog.client: true

rsyslog:
  client:
    enabled: true
    format:
      name: TraditionalFileFormat
      template: '"%TIMESTAMP% %HOSTNAME% %syslogtag%%msg:::sp-if-no-1st-sp%%msg:::drop-last-lf%\n"'
    output:
      file:
        /var/log/syslog:
          sync: true
          filter: "*.*;auth,authpriv.none"
          owner: syslog
          group: adm
          createmode: "0640"
          umask: "0022"
          enabled: true
        /var/log/auth.log:
          sync: true
          filter: "auth,authpriv.*"
          owner: syslog
          group: adm
          createmode: "0640"
          umask: "0022"
          enabled: true
        /var/log/kern.log:
          sync: true
          filter: "kern.*"
          owner: syslog
          group: adm
          createmode: "0640"
          umask: "0022"
          enabled: true
        /var/log/mail.log:
          sync: true
          filter: "mail.*"
          owner: syslog
          group: adm
          createmode: "0640"
          umask: "0022"
          enabled: true
        /var/log/mail.err:
          sync: true
          action: /var/log/mail.err
          filter: mail.err
          owner: syslog
          group: adm
          createmode: "0640"
          umask: "0022"
          enabled: true

## Example board definition for sftesthost
sftesthost:
  boards:
    board0:
      type: arty
      alias: arty0
      console_type: usbtty
      console_dev: /dev/ttyusb0
      manage_type: digilent
      manage_serial: 01234567
      debug_type: ftdi
      debug_serial: 01234567
    board1:
      type: vc
      subtype: vc707
      alias: vc0
      console_type: usbtty
      console_dev: auto
      debug_type: ftdi
      debug_serial: auto
    board2:
      type: hifive
      subtype: hifive1
      alias: hifive0
      console_type: usbtty
      console_dev: /dev/ttyusb0
      debug_type: ftdi
      debug_desc: auto

