# Default settings specific to RedHat-style OSs

states:
  autofs: true
  pkgs.yum: true
  chrony: true
  pam.sss: true
  pam.pwquality: true
  pam.mkhomedir: true
  nsswitch: true
  

pkgs:
  list:
    autofs: true
    pam_krb5: true
    sysstat: true
    dstat: true
    lsof: true
    iotop: true
    strace: true
    sssd: true

    screen: true
    tmux: true
    rsync: true

    zip: true
    unzip: true
    
    tcsh: true
    zsh: true
